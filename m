Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1B718DB25;
	Sun, 16 Feb 2025 13:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739714245; cv=none; b=ZB78lqe3pPWdPKFsllMdT8iD8C2tCogfOgIZ/ORWRR2Vo/Qt3L46CSL4Ay82v6S057oqx8ZDQSPEVpZjkE4Uj4AgEPXiq9nBqYAfmg6g8DuCSkUc/6FTfI+t6LPt5E4PSn3UDZkZMiqBipynwgv64VFPFW6UrvIHLQrQS0Ctepo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739714245; c=relaxed/simple;
	bh=c3GWxt2iVIeXvwo+U0I1BIYxIVl/i6O17+YA/xdzqV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOXcjL/MBT/ziwr04xr0LvW4FYA9OLEaPE/CHvZKCRaKwJT+JXL8sTbY/1kKeKDxCgJ61RSpnix0G6NdHM/enhuSTew6+8LoupnKFsg94qmWOPnM06p3RpDFCEcWHEqytR4bIHiZHgHJzZ4vRAhPzxNRIIfr42KEiMtLuETKXp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLqCZdYi; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLqCZdYi"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4397e5d5d99so1448855e9.1;
        Sun, 16 Feb 2025 05:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739714242; x=1740319042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJMYNx5xh9JOrzEUO5t5CueFCzDt0HEwgJdTTyYg3Z8=;
        b=QLqCZdYitFxCwJzzWBu04+09JXzuRKWjUoYD0TIWwEPyWigq6va4jRigMD0+O2Nwn8
         iseJ7xpmK1R0aHHBx3AOAY0ttE0hYjIW9/Q5UWbAhcu5//KlllsScb8TwRQYModw3kqk
         OcdvYD+y2cx3kn98FUlFkmxydXQnuo9lYFDXUcMt0yPXPiy5bkze8qjrjdBc2lNJ5p7W
         w3PH0uC30aErqHVFeeSzIBKpqfzpA9lDZY4iibjHt8d0sWXNg11asgRcuivpZfg+BPsa
         k8MgAjTA3CLziaSLRSe+46e72pa46PcTjfsqKNAYSUhLy+fV36K963BxmZDF8rN7HuiY
         JVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739714242; x=1740319042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yJMYNx5xh9JOrzEUO5t5CueFCzDt0HEwgJdTTyYg3Z8=;
        b=GsfpMhB63M1SOF1f0kkHX3scKiFZexj38xXxmA54ZAJsVwdk88g4nd74bQ3OuJkycw
         2u2eyxVNUVP5+XEm64YA450lMTvp8vlQvNTwcgrT+qenGV500qUg4fmnpwtEMCy2Ij8b
         Yx8v/Dn12pn0dVtkAHEmI82N5v1WY1qFcdU3sHLu49Gs3Dh0Nw4UnwqyTK8JNGWkgSww
         S9O+Ya67NsLXnrf2EkXvToRvTQBpoJ0NJvUZcth7asaCotLEe9TD7hd4bKzI7ewAQo5F
         u23q50j0iDPl3UuXqsYw6yrRbai0sNpAjXrcbzSMedad88kY4Wr7aNQd4DSPyRbC4CsL
         qcSg==
X-Forwarded-Encrypted: i=1; AJvYcCUxfq5y57jdnp3gFJdkke5qbj9xQBlSkmTAq68JJE4T3Wq+g3LvsSXy36phkckC9cXPeEBcI2kVLxdx@vger.kernel.org, AJvYcCWcc0pRkdYwFJ6O1M5olSlUkYuB2d1kQjv84ZlR+TGvI318cvFnxKUqIJc1gHDo1Ja1Rx6mTutnrYobDtMF@vger.kernel.org, AJvYcCXHN878sTGovLknnfYWhOdZ53o+/VLrjf89XZBYPutimYb7m6IqMCWPTk+9YYatGtV/5ZmofELXfyj3agcXBG/8MPs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/QI5eP80+H2JSGOuZt79jiyd7Vip6nYF40HewK+TgAVwZm+bd
	kMnCXyVHJCyTbQe4TQqqkLfYa6xHXQx80wwHlTKRNXljVqwSc16V1qlKjA==
X-Gm-Gg: ASbGncub3fas2U2mZehKp/imColazn2bxO+YMALJ9w86VbMOToeLjdxh8OIxaXrv/z5
	oK0vRtr3GKCktCNrhW7Ve4+blJLQief53xVemhfwFmGXgIrjcTg2PngNgQnv2Rx3GdfCeDWIWoN
	nJdwOw9VAu2jOHvaJkT8cddldqb2YXuw0zAFjSp7YMViR2lm2dBbPoY0s07f62u/lf08tQym7rh
	XNMegLXAeJK+5j4QGUlsGX2oTGXqHVmmjnL8PqGyrWX+NLD94Bxl5p3e8GjRbygvxDc4xjSXgHB
	9WY+gZQDiAtzOXFVEsNPlb/iXgcZ3ouZGLNyTWWoFfUCEqAk6bTg3FHEf3FT4u7qW4c3Rw==
X-Google-Smtp-Source: AGHT+IFH9P92DQEv+xDDvDm9W5ccn+THKcRoWXfgct7p20f+QmQCJMvkd68mMzwjnpUEl/jDGCrMHg==
X-Received: by 2002:a05:600c:4450:b0:434:a525:7257 with SMTP id 5b1f17b1804b1-4396e750cd8mr46356975e9.21.1739714241511;
        Sun, 16 Feb 2025 05:57:21 -0800 (PST)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8602sm9959504f8f.94.2025.02.16.05.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Feb 2025 05:57:21 -0800 (PST)
Message-ID: <cc6fc19e-cdcb-42bb-ba68-555cb8a9cbf5@gmail.com>
Date: Sun, 16 Feb 2025 15:57:19 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] phy: samsung: add Exynos2200 SNPS eUSB2 driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250215122409.162810-1-ivo.ivanov.ivanov1@gmail.com>
 <20250215122409.162810-4-ivo.ivanov.ivanov1@gmail.com>
 <a10f8a77-9440-477d-b6f6-9d651e3ab49a@kernel.org>
 <537698af-841f-48e7-bd7c-4077d0a240a1@gmail.com>
 <9b58a985-3d63-42bb-9a76-e5b04a4b6012@kernel.org>
 <f3d38b63-dc97-482e-aeac-b59e65f91424@gmail.com>
 <065ea296-480c-4ac4-bb4a-0fc2915b59f1@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <065ea296-480c-4ac4-bb4a-0fc2915b59f1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/16/25 15:19, Krzysztof Kozlowski wrote:
> On 16/02/2025 10:51, Ivaylo Ivanov wrote:
>>>>>  You need to
>>>>> integrate the changes, not create duplicated driver.
>>>> I can do that, but it would be come a bit cluttered, won't it? Depends on
>>>> if we want to follow the current oem-provided initialization sequence, or
>>>> try and fully reuse what we have in there.
>>> I think it duplicates a lot, so it won't be clutter. We have many
>>> drivers having common code and per-variant ops.
>> So the approach to take here is to make a common driver?
> For example: one common module and two modules per each soc, because I
> assume some per-soc stuff might be needed. But maybe even these two
> modules are not necessary and everything could be in one driver.

The issue here is that, while both QCOM and SAMSUNG use that IP, a lot of
the registers are not mapped for Exynoses.

For example with QCOM:
``
#define USB_PHY_UTMI_CTRL0 (0x3c)
#define PHY_UTMI_CTRL5 (0x50)
``

Exynoses:
``
/* nothing before this */
#define EXYNOS2200_EUSB2_RST_CTRL 0x0
``

Here EXYNOS2200_EUSB2_RST_CTRL seems to be the same register as
QCOM_PHY_UTMI_CTRL5. Another instance is:
``
#define UTMI_PHY_CMN_CTRL0 (0x98)
#define TESTBURNIN BIT(6)
``

Exynoses:
``
#define EXYNOS2200_EUSB2_TESTSE (0x20)
#define EXYNOS2200_TEST_IDDQ BIT(6)
``

But at the same time there are some.. inconsistencies between them.
Looking at the register layout for the exynos implementation for TX tuning
the following register offset and bits are described:
``
/*
 * Offset : 0x0014
 * Description: tune register of tx driver
 */
typedef union {
  u32 data;
  struct {
   // bit[0] :
   unsigned fsls_slew_rate : 1;
   // bit[2:1] :
   unsigned fsls_vref_tune : 2;
   // bit[3] :
   unsigned fsls_vreg_bypass : 1;
   // bit[6:4]
   unsigned hs_vref_tune : 3;
   // bit [8:7]
   unsigned hs_xv : 2;
   // bit [11:9]
   unsigned preemp : 3;
   // bit [13:12]
   unsigned res : 2;
   // bit [15:14]
   unsigned rise : 2;
   // bit[31:16]
   unsigned RSVD31_16 : 16;
  } b;
} EUSBCON_REG_TXTUNE_o, *EUSBPHY_REG_TXTUNE_p;
``

And for QCOM the latter functionality is split into two separate register
offsets:
``
#define USB_PHY_CFG_CTRL_8 (0x78)
#define PHY_CFG_TX_FSLS_VREF_TUNE_MASK GENMASK(1, 0)
#define PHY_CFG_TX_FSLS_VREG_BYPASS BIT(2)
#define PHY_CFG_TX_HS_VREF_TUNE_MASK GENMASK(5, 3)
#define PHY_CFG_TX_HS_XV_TUNE_MASK GENMASK(7, 6)

#define USB_PHY_CFG_CTRL_9 (0x7c)
#define PHY_CFG_TX_PREEMP_TUNE_MASK GENMASK(2, 0)
#define PHY_CFG_TX_RES_TUNE_MASK GENMASK(4, 3)
#define PHY_CFG_TX_RISE_TUNE_MASK GENMASK(6, 5)
#define PHY_CFG_RCAL_BYPASS BIT(7)
``

So, Exynos2200 has a much simpler eusb initialization sequence than what
is present in mainline for QCOMs. I still don't really think the drivers
should be merged, as we aren't really duplicating code per-say.

I've already started working on merging them, and my current idea is to
not redefine the registers once again for 2200, but rather make an enum
that defines if the SoC is a QCOM or EXYNOS, and select the register
offsets dynamically - similarly as how I did with USIv1. If a register
offset is not present, it'd just not do the write. My guess is that this
will make it work with the qualcomm init sequence as well, so it'd result
in even less redundant code (apart from the eUSB tuning, which can be
omitted for now).

>
>> What about the current modelling scheme, as-in taking the phandle to
>> the usbcon phy and handling it?
> What about it? 

As I said in the commit description, I'm passing the USBCON phy as a
phandle to the eusb2 node and enabling/disabling it when needed. I'm
not 100% sure it would be adequate to include that in a common snps EUSB
driver, as it seems to more of a quirk with the exynoses. But then how
can I model it so that it's correctly described according to how the
hardware works (as-in usbcon "muxing" between child phys, in this case
eUSB and snps USBDP combophy)

Regarding repeaters, I still don't have the TI repeater implemented.

Best regards,
Ivaylo

> Did you look at the bindings of qcom snps eusb2? Are you
> saying you do not have here repeater? If so, then this phy phandle might
> not be correct.
>
>
>
> Best regards,
> Krzysztof

