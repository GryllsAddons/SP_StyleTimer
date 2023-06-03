-- SP_SwingTimer
if IsAddOnLoaded("SP_SwingTimer") and (not IsAddOnLoaded("GryllsSwingTimer")) then
    local addonpath = "Interface\\AddOns\\SP_StyleTimer"

    local sections  = {
        'TOPLEFT', 'TOPRIGHT', 'BOTTOMLEFT', 'BOTTOMRIGHT', 'TOP', 'BOTTOM', 'LEFT', 'RIGHT'
    }

    local function skin(f, offset)
        local t = {}
        offset = offset or 0
            
        for i = 1, 8 do
            local section = sections[i]
            local x = f:CreateTexture(nil, 'OVERLAY', nil, 1)
            x:SetTexture(addonpath..'\\img\\borders\\'..'border-'..section..'.tga')
            t[sections[i]] = x
        end

        t.TOPLEFT:SetWidth(8)
        t.TOPLEFT:SetHeight(8)
        t.TOPLEFT:SetPoint('BOTTOMRIGHT', f, 'TOPLEFT', 4 + offset, -4 - offset)

        t.TOPRIGHT:SetWidth(8)
        t.TOPRIGHT:SetHeight(8)
        t.TOPRIGHT:SetPoint('BOTTOMLEFT', f, 'TOPRIGHT', -4 - offset, -4 - offset)

        t.BOTTOMLEFT:SetWidth(8)
        t.BOTTOMLEFT:SetHeight(8)
        t.BOTTOMLEFT:SetPoint('TOPRIGHT', f, 'BOTTOMLEFT', 4 + offset, 4 + offset)

        t.BOTTOMRIGHT:SetWidth(8)
        t.BOTTOMRIGHT:SetHeight(8)
        t.BOTTOMRIGHT:SetPoint('TOPLEFT', f, 'BOTTOMRIGHT', -4 - offset, 4 + offset)

        t.TOP:SetHeight(8)
        t.TOP:SetPoint('TOPLEFT', t.TOPLEFT, 'TOPRIGHT', 0, 0)
        t.TOP:SetPoint('TOPRIGHT', t.TOPRIGHT, 'TOPLEFT', 0, 0)

        t.BOTTOM:SetHeight(8)
        t.BOTTOM:SetPoint('BOTTOMLEFT', t.BOTTOMLEFT, 'BOTTOMRIGHT', 0, 0)
        t.BOTTOM:SetPoint('BOTTOMRIGHT', t.BOTTOMRIGHT, 'BOTTOMLEFT', 0, 0)

        t.LEFT:SetWidth(8)
        t.LEFT:SetPoint('TOPLEFT', t.TOPLEFT, 'BOTTOMLEFT', 0, 0)
        t.LEFT:SetPoint('BOTTOMLEFT', t.BOTTOMLEFT, 'TOPLEFT', 0, 0)

        t.RIGHT:SetWidth(8)
        t.RIGHT:SetPoint('TOPRIGHT', t.TOPRIGHT, 'BOTTOMRIGHT', 0, 0)
        t.RIGHT:SetPoint('BOTTOMRIGHT', t.BOTTOMRIGHT, 'TOPRIGHT', 0, 0)

        f.borderTextures = t
        f.SetBorderColor = SetBorderColor
        f.GetBorderColor = GetBorderColor
    end

    local function skinColor(f, r, g, b, a)
        local t = f.borderTextures
        if not  t then return end
        for  _, v in pairs(t) do
            v:SetVertexColor(r or 1, g or 1, b or 1, a or 1)
        end
    end

    -- local w, h, b = 200, 14, 6
    local h, b = 14, 6
    -- set mainhand
    -- SP_ST_Frame:SetWidth(w)
    SP_ST_Frame:SetHeight(h)
    -- SP_ST_Frame:SetScale(1)
    -- SP_ST_Frame:SetAlpha(1)
    -- -- set oh
    -- SP_ST_FrameOFF:SetWidth(w)
    SP_ST_FrameOFF:SetHeight(h)
    -- SP_ST_FrameOFF:SetScale(1)
    -- SP_ST_FrameOFF:SetAlpha(1)
    -- set position
    SP_ST_Frame:ClearAllPoints()
    SP_ST_FrameOFF:ClearAllPoints()

    SP_ST_Frame:SetPoint("CENTER", 0, -250)
    SP_ST_FrameOFF:SetPoint("TOP", "SP_ST_Frame", "BOTTOM", 0, -4);

    SP_ST_FrameTime:ClearAllPoints()
    SP_ST_FrameTime2:ClearAllPoints()            
    
    SP_ST_FrameTime:SetPoint("CENTER", "SP_ST_Frame", "CENTER")
    SP_ST_FrameTime2:SetPoint("CENTER", "SP_ST_FrameOFF", "CENTER")
    -- set time
    -- SP_ST_FrameTime:SetWidth(w)
    SP_ST_FrameTime:SetHeight(h-b)

    -- SP_ST_FrameTime2:SetWidth(w)
    SP_ST_FrameTime2:SetHeight(h-b)
    -- hide icons
    SP_ST_mainhand:SetTexture(nil)
    SP_ST_mainhand:SetWidth(0)

    SP_ST_offhand:SetTexture(nil)
    SP_ST_offhand:SetWidth(0)

    SP_ST_mainhand:Hide()
    SP_ST_offhand:Hide()
    -- hide timers
    SP_ST_maintimer:Hide()
    SP_ST_offtimer:Hide()
    -- hide oh
    -- SP_ST_FrameOFF:Hide()
    -- SP_ST_FrameTime2:Hide()       
    
    local i = 2
    skin(SP_ST_Frame, i)
    skinColor(SP_ST_Frame, 0.4, 0.4, 0.4)
    skin(SP_ST_FrameOFF, i)
    skinColor(SP_ST_FrameOFF, 0.4, 0.4, 0.4)

    SP_ST_Frame:SetBackdrop({
        bgFile = "Interface/DialogFrame/UI-DialogBox-Background",
        insets = { left = i, right = i, top = i, bottom = i }
    })
    SP_ST_FrameOFF:SetBackdrop({
        bgFile = "Interface/DialogFrame/UI-DialogBox-Background",
        insets = { left = i, right = i, top = i, bottom = i }
    })
end