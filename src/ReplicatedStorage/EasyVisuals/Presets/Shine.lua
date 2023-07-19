local TextEffects = require(script.Parent.Parent);

-- Making colors lighter
local function makeLighter(color: Color3, amount: number): Color3
    return Color3.new(math.clamp(color.R + amount, 0, 1), math.clamp(color.G + amount, 0, 1), math.clamp(color.B + amount, 0, 1));
end

return function(uiInstance: GuiObject, speed: number, size: number, customColor: Color3)
    -- We're not going to use a GradientTemplate because this requires us to do some things with the customColor
    local color1 = customColor;
    local color2 = makeLighter(customColor, 0.417505);
    local color3 = customColor;

    local colorSequenceForShine = ColorSequence.new({
        ColorSequenceKeypoint.new(0, color1),
        ColorSequenceKeypoint.new(0.5, color2),
        ColorSequenceKeypoint.new(1, color3)
    });

    local mainGradient = TextEffects.Gradient.new(uiInstance, colorSequenceForShine, 0);
    mainGradient:SetOffsetSpeed(speed * 0.6, 1);
    mainGradient:SetRotation(60, 1);
    return {mainGradient};
end