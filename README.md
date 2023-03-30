# LibDBCompartment

World of Warcraft library for integrating addons into Blizzards' minimap addon compartment through [LibDataBroker](https://github.com/tekkub/libdatabroker-1-1) data objects.

The design of the library mirrors that of [LibDBIcon](https://www.curseforge.com/wow/addons/libdbicon-1-0) and provides a nearly identical public interface, with the exception that direct integration of saved variables for persisting compartment button visibility is *not* provided.

In game flavors that don't support the addon compartment the full API of the library can be used as normal, but the library will not attempt to register any button entries into the non-existent compartment dropdown list.

## Dependencies

The library is versioned through [LibStub](https://www.curseforge.com/wow/addons/libstub) and is assumed to be loaded by any consuming addon. The library does not hard-embed or load any dependencies.

Due to [WoWUIBugs#299](https://github.com/Stanzilla/WoWUIBugs/issues/299) it is **strongly recommended** that [TaintLess](https://www.townlong-yak.com/addons/taintless) also be embedded and loaded by consuming addons, otherwise integration of the addon compartment may lead to forbidden action errors when Edit Mode is entered.

## Embedding

The library may be imported as an external in a `.pkgmeta` file as shown below, through the use of a Git submodule, or by downloading an existing packaged release and copying it into your addon folder.

```yaml
externals:
  Libs/LibDBCompartment: https://github.com/Meorawr/LibDBCompartment
```

To load the library include a reference to the `lib.xml` file either within your TOC or through an XML Include element.

```xml
<Ui xmlns="http://www.blizzard.com/wow/ui/">
    <Include file="Libs\LibDBCompartment\lib.xml"/>
</Ui>
```

## Usage

Basic usage mirrors that of LibDBIcon - assuming you've got a data object created already just make a call to the `:Register(name, object)` function and you're good to go!

```lua
local LibDBCompartment = LibStub:GetLibrary("LibDBCompartment-1.0")
LibDBCompartment:Register("MyAddonName", MyAddonDataObject)
```

The `:Show(name)` / `:Hide(name)` / `:SetShown(name, shown)` functions can be used to dynamically control whether or not your registered compartment entry will be shown in the dropdown or not. By default entries are shown upon registration.

Modifications to attributes on the data object will be reflected in the dropdown entries automatically, however the `:Refresh(name)` function may be called manually to force this if necessary. Note that modifications to entries while the compartment dropdown is open will _not_ update the dropdown list until it is closed and re-opened.

The dropdown entry info table itself can be acquired via `:GetDropDownButtonInfo(name)` and modified as needed - however note that the `.text` and `.icon` fields will be replaced if attributes on the underlying data object later change.

For addons that relocate the minimap or the compartment as a whole, the `:SetTooltipAnchor(anchor)` function may be used to alter where the library-provided tooltip is positioned. See the source file for more information.

## License

The library is released under the terms of the [Unlicense](https://unlicense.org/), a copy of which can be found in the `LICENSE` document at the root of the repository.

## Contributors

* [Daniel "Meorawr" Yates](https://github.com/meorawr)
