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
    "SLASH_LDBC1",
    "SlashCmdList",
};

read_globals = {
    "AddonCompartmentFrame.RegisterAddon",
    "AddonCompartmentFrame.UpdateDisplay",
    "AnchorUtil.CreateAnchor",
    "C_AddOns.GetAddOnMetadata",
    "CreateFrame",
    "GameTooltip",
    "GetAddOnMetadata",
    "LibStub.GetLibrary",
    "LibStub.NewLibrary",
    "tIndexOf",
    "UIParent",
};
