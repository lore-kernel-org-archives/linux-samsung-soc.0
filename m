Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795776027;
	b=yJusl/oIR0qZHHEBDgb3xtLZA6yZT4stYQJH58trrHEhc6SWGZerCP/VKJIvNIxTEri0
	 KA4n2WnypBBns5GmaQTvV2Uf5khOW6kuDWePaezJyBZRGsVJda7Tfxee04kwFh9SNoECw
	 wqVD8QeW+ZOFH01uclcoG6s4bD+qIsN0lapmEGYORTuGS5P0CBaNU+z0Oy0M3wzNPuczY
	 Ty3rgOMetujIWejubMWARkmf2tOTf+0veqdHCeHlRuy8jz/NPysrIlAweLV/V3xXWwrtD
	 i6Ax+Mrkhv2b8GpIJBjZmBxb9cnoi5kLcan1aER0rZPaIygbnCkGErRfdqnyP742njQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795776027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=0MjmSAAhpe5cqP7I84bvnQ40cKtlwbqwpo+pqHT1S+8=;
	b=26gidoI9Gmj27L7OacAvefX+d6uScPEtajvsxAo/TCZJv4cs2e3qDlENx3z8b9IJIy5z
	 CkWtluD1KZhjenXcYXOtvKqCcNrhm8/X4Wp6sEIAclcKNRHEJaNv/QRxYbsxpGaw6iwwF
	 hyiXV3tiH2MuaFrW6T+/QHr42kdeY9XiglapIjGOoodVYT+SMY7iTrr1V8QAkX5kV8dYl
	 sw5bB8nvRWO4e9q9VENNuzwpqZ/sZk+Bs+60VFn6A5bfsgJ379QKuO+/pYqjyncQbAKAs
	 0fA/tCprhqT0G/7fgCU95gRpNinT7+U1Z2tXhqI7fz4Yfe7CyjeriT4qDOQXq/1lIKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dBsrZ6+T;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29B1606A329
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Nov 2026 10:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D29B1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dBsrZ6+T
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b87408c797so2038849a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Nov 2026 02:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795776025; x=1796380825; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0MjmSAAhpe5cqP7I84bvnQ40cKtlwbqwpo+pqHT1S+8=;
        b=dBsrZ6+Tx9NngHi25UXo3zVvlNSGzeTecI35aa1EMzKiA20cYwQ9kIYSYbJXlFE45n
         xo/CRMrccnn+ohJyXqDOegZX4zHq3Tz39Kr31OrO2tPOY9ulF0bvadZIZC2ZAaApyfIu
         wxrWczUDV9bNQ02PA9XmPgb9LqJGmHl8zjasWuIfbY5raGGho+ljxtFOYgGLj9NERqsI
         IefaIQTLcYcLlfYGL29MSwFvkYIhjdeTQG+M7RjbW/3ke3+GN/tOQFcwR8iWmFmI9OSa
         YVt1I/aoRdY49/Hu54a8Fo7/jjtqi34jWsI/bCX2VYdcbC1hqzP3O8TgARmmRpZDDdQZ
         507Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795776025; x=1796380825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0MjmSAAhpe5cqP7I84bvnQ40cKtlwbqwpo+pqHT1S+8=;
        b=OwQLvZoOiFKZhYIbItagh7bBdvmyFW+6J0/VHhbr7fFMlCqX8wDlVR6Lhy+FQw9icG
         /0ZSMOYPndilBWc6QUtjDLcbnx41Q/beV3XbYBQIeUKiLlHE4rT8N9G+f1sjkse9Y0Od
         edjg2ML70g7XVRg3krigktkqQRKXCu0T8k43Jx2m+7xS86i3NIc/j9OwjLRXXA31Jafw
         LORoBYz7A6jgPzDnsngnbmbU1sT9Zv7+EBPma3gTy1h4XbSHUjfbd2XtuseUz9w7OhkE
         iXKLjMCRysSHrDEVOSf10XB78TeTNJgCAECBn5aSVmF6JyoKwtTDXDElMsYkmZD6ILSl
         FcQg==
X-Forwarded-Encrypted: i=1; AL+hErFMycpecfHbLWBTAWkpHOp6lfUivPFwqeaPE2IO4v4L9I/ALNK5xgcysFFeqrs0OuRmx1wcAVMlpTTBGaPDWXyXZA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8jtOmCqgPUt9jwNMWgCHkmAcqYj7ejveq1X1CoEHlU7aG1k0Ya
	K0lTkWJngo1wN6bLu1+mDiGcNt2rGoep9/yRzutOINEwZ7r18+IUfg0e1UF0HHewBxw=
X-Gm-Gg: AZFdTZfks9PtYXpn4nYbKLDWjOsZoOsEITGhoA5s1P1Dvy8910vVbnqv9fUSsubPKZk
	yh+7n+Jbf9vKIQFFrG1QfAdtYHk6mDGYFtK4YjSFROhh4wAfAdifUt3T+nhOJfvXX8qkPpONxOS
	Dw7MiNQA55o1kx2byrWfr2pmM3XDeCa2anSzUO96391+YbErhNRMliDlo7Quka40LAFEt7B5lRt
	sU2O6nYaIW921tH/kKS7p9LfEThEmq/2SShtywe1fp3zL4VXPfeipwsDTVLrjOtvEkIVck8KH2X
	JgaoT4Bc5vGsv9Rwy5aCRgvDnwPnOZ7aFj2S6piI8hHsbJhfWppfZNULNQae6m0vZSXwajuuBID
	rLngXSBNBF0u7ZxchSrPEjY/ZEHSOKTL1W+2MccrJtjZtfuIrGQB32VR+v+N3EzD3Tb/kR0H9f3
	wNx9ozK5P7y950mT8CUyrOL0aLLo+HJDB7wggqvCDTd/hxJvutnM4KWiCRsTIEjarDYw3ElIRgq
	pnbOkQpYODqmJsBA1wt5C9jkFwVweDVOjDqVgKiXzuWlDYJpvqnKRPOkhwNYT3WOrYAdq7K0+Yo
	NvroIK4Q3jsjfeOg1tvm5lCJxgqpZVwk6hbvQPXBtUhQsBx8TPcCeEjROF5GNHM3kUqeBQWIhLT
	XjibtlDB6NSY2oTfdsDiPuzzRBgvp967ACvakQh4=
X-Received: by 2002:aa7:d353:0:b0:6ba:22f7:189e with SMTP id 4fb4d7f45d1cf-6ba37d63cdbmr12166261a12.7.1795776025312;
        Fri, 27 Nov 2026 02:40:25 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb11ff543fsm3919199a12.2.2026.11.27.02.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:40:24 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 27 Nov 2026 10:40:21 +0000
Subject: [PATCH 1/3] phy: samsung: gs101-ufs: terminate pre_pwr_hs config
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261127-gs101-ufs-phy-oob-v1-1-144b0e04c3a8@linaro.org>
References: <20261127-gs101-ufs-phy-oob-v1-0-144b0e04c3a8@linaro.org>
In-Reply-To: <20261127-gs101-ufs-phy-oob-v1-0-144b0e04c3a8@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-hardening@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

Booting a gs101 platform with KASAN triggers a global-out-of-bounds
read during UFS PHY calibration:

    BUG: KASAN: global-out-of-bounds in
     samsung_ufs_phy_calibrate+0x144/0x530
    Read of size 1 at addr ffff8000825a894d by task (udev-worker)/179
    Call trace:
     kasan_report+0xb0/0x108
     __asan_load1+0x98/0xa0
     samsung_ufs_phy_calibrate+0x144/0x530
     phy_calibrate+0x70/0xc0
     exynos_ufs_pre_pwr_mode+0x280/0x2b0 [ufs_exynos]
     exynos_ufs_pwr_change_notify+0x208/0x2b8 [ufs_exynos]
     ufshcd_change_power_mode+0x58/0xd0
     ufshcd_config_pwr_mode+0xf4/0x1f0
     ufshcd_post_device_init+0x2fc/0x4c8
     ufshcd_init+0x12bc/0x18a0
     ufshcd_pltfrm_init+0x200/0x3d0
     exynos_ufs_probe+0x48/0xa0 [ufs_exynos]
    The buggy address belongs to the variable:
     tensor_gs101_pre_pwr_hs_config+0x2d/0x40

samsung_ufs_phy_calibrate() iterates through each configuration table
with for_each_phy_cfg(), stopping only when cfg->id is 0.
tensor_gs101_pre_pwr_hs_config[] omits the END_UFS_PHY_CFG sentinel,
so the loop reads past the end of the two-element array into adjacent
memory (offset 0x2d is cfg[2].id).

Add the missing END_UFS_PHY_CFG terminator to
tensor_gs101_pre_pwr_hs_config[].

Fixes: c1cf725db106 ("phy: samsung-ufs: ufs: Add support for gs101 UFS phy tuning")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/phy/samsung/phy-gs101-ufs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/samsung/phy-gs101-ufs.c b/drivers/phy/samsung/phy-gs101-ufs.c
index a15e1f453f7f..d4af94f3fed4 100644
--- a/drivers/phy/samsung/phy-gs101-ufs.c
+++ b/drivers/phy/samsung/phy-gs101-ufs.c
@@ -98,6 +98,7 @@ static const struct samsung_ufs_phy_cfg tensor_gs101_pre_init_cfg[] = {
 static const struct samsung_ufs_phy_cfg tensor_gs101_pre_pwr_hs_config[] = {
 	PHY_TRSV_REG_CFG_GS101(0x369, 0x11, PWR_MODE_ANY),
 	PHY_TRSV_REG_CFG_GS101(0x246, 0x03, PWR_MODE_ANY),
+	END_UFS_PHY_CFG,
 };
 
 /* Calibration for HS mode series A/B */

-- 
2.56.1.839.g22a8290db9-goog

