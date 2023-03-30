std = "lua51";
self = false;
max_code_line_length = 118;
max_comment_line_length = 118;
max_line_length = 118;
max_string_line_length = 118;

exclude_files = {
    ".release",
    "Libs",
};

globals = {
    "AddonCompartmentFrame.registeredAddons",
};

read_globals = {
    "AddonCompartmentFrame.RegisterAddon",
    "AddonCompartmentFrame.UpdateDisplay",
    "AnchorUtil.CreateAnchor",
    "CreateFrame",
    "GetAddOnInfo",
    "LibStub.GetLibrary",
    "LibStub.NewLibrary",
    "tIndexOf",
    "UIParent",
};
