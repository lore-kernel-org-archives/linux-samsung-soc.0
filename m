Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632F13546D8
	for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2026 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483123; cv=pass; b=fdVq9J30iqnAfM3sYLgPTAJFCrVE+wd9JHmJ4G9A6MoO4q7hQ01gai+z1y/A/A+Fu4p7zvKXb3pooIcy7IJ8cXWKUYv6Eunwxqn5wiRWXUYbZh+NXTlT6k5Gh67wO/ZgSuRoSC2fg6N7jCJ5G8TH115SJ/3QU52PQWrhOxKeM/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483123; c=relaxed/simple;
	bh=iel1Zg3Gn2JgaK8/39sWaPWO9gbsJitWrIWTrMJvzaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k1U0p7MDikPZMxjGnXM+nh/QxQvaDai0/51DlykWq4wSp9/rcLeweNxxMb1AF7ihWRD84VRm0XzUw8r8ELxBnq5ELCsQ7a66bxJrrcKF2UNJRDbKxWuU8YgC9Y72vNRL1FaB37ScDPborVIc2IuWdvRZeT9k72jTkRmBBwflNJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PXv4jCmq; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PXv4jCmq"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a67fa7a64eso5820899a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Sep 2026 07:38:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789483119; cv=none;
        d=google.com; s=arc-20260327;
        b=eHFNr9FNV3OCiWpgy5qwzUbU1ywInJETBZjY2lQkPJJSSsnxVIGG0c0aBmilv6nFc4
         1bTl3W4ScL3UAFJNt+MDxrBWl3H8fxiJxG+BKfPxDD+45HoGb+E1JxmaZrfKmNJY/Gq5
         7MivVrFKU1nA/F7cQys7PYkHTcmUwMYB2E8qTVc+uvpICPJsb9L4NUtK5bLEXr0dEfs/
         d2s0aNq+M84P0uWrn6RiRav3fzIyBgwFgGfyN8WdCk481YJcBElKdrliISOIn5+wJo0Y
         e9TAWp5+W1uKeWRzjYNc6SFa5MtmTvskq+z7UYXaFjiSRg74wYiH7y2RGCsiJL1RryDI
         iYGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hJD9UyfEwkXA50QAdx7qCZZmHoP06c3J8prX9fzshMY=;
        fh=HJ1JDVbNFfQpUR77XvQqWtnqv8rxSUYVBqFTgnP4zak=;
        b=L9mrjlP3vy1cecqOlmwvA9roa761SSX2Wg99vlTgZ5RnwsgEmcrLVj0bRG6cR86JON
         yqRgJ7nbtENdMcX87cxNSv6UVdeCfBhhnGcfZyAY8ZP6d7lQKIinD39H2qCXy293HOkW
         JYwrkKo3cCrAYc6O254ChP2X7mK6LJN5gXAammPMVrLaTb2iVBVT1T2uYhLpPg2cZsvh
         Yob60rA77vHrVe8+ICS/1/7dpyNJBTveZHByuymbBeXyUO6i3ZodnkA2Hyx1hMzA/x8T
         4NckD9fXg+WwdTjxMm/OWHxYA0XesK2YxFQoPvr46HoETnOl7i+b+zoT5NiqsvRDFzFB
         /Yag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789483119; x=1790087919; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hJD9UyfEwkXA50QAdx7qCZZmHoP06c3J8prX9fzshMY=;
        b=PXv4jCmqfVuTx9gB/+PJTsyh1geSXnaXL6f3DnyLQDNSfxk2nG5l73W/6MeGQI/sdf
         gIbjvsi41kCLzqZ1m3q9Ss7VISmknhJERm1jD/+ixKDa8OwVBeHYiBDwkYlvbyy4iVZ9
         ZqEx/tHwdjzjPxjg9/P+4Xo91TDJvpLTL9xZ43o9OnyIXXv2lokFyh9I9J/zreRdU8zG
         0hoNAauG/VIUmNHJS0Yoox1n1POnNZy7p9hkS/9p2f4Hy5EGAsZQ0zInjaXLOiYJR0xv
         a00XF110rKdqBsYaSALuZ0H0BcUCriro1HN2jAlexbiu74sQEMG50VKqMNi6yXjb8lgW
         Lwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483119; x=1790087919;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hJD9UyfEwkXA50QAdx7qCZZmHoP06c3J8prX9fzshMY=;
        b=OHuNO9Kp2ryy3tk3hfzCwO6hf82tmj4suId34lMzZdOFUbHPQteUaeeLvSRwMupc7Q
         v6T8ZrbYsAFx+Pcq2tNzMx5d9tcDbp5KPSm7AwSVaWkZC5uhZLGxNAIABUnz+wqG6Mod
         QVRDDl5GmguPF77Htwlf74YzXiyEA0LnbrJdfiBNyz/I7/mYklXiN2XfLX2mKDAmPdra
         jfAO//nG9bOuRIfimzDrejwSZz1oSBVfUMV2/vG2DtORZRvMAuNt8s1eFNTiuzWHe9K9
         4jbVjNLX73Klhs4q+LDJMFTwcDPYh3FSemMawqOpti2l0LBJRs+N+21EU5KN8sA7dkbQ
         rKYA==
X-Forwarded-Encrypted: i=1; AKwUvBwkxIXo0te88tSUoAONfb34X0p6XgaSKp7ld9+14NH3rnvYx47xcyb2WOZNpUJrcYD19ktLE4o3qrzROLzDVVfrjg==@vger.kernel.org
X-Gm-Message-State: AFuF++lr3KnmdurhesN5icKXyf0gHzG3Giakv1iz7AExwMIrE8mwvrM3
	8HN5E97IXzTP6Qe8geh5KHgQPknlBDNlpM8RW+XNvvpCkqFT9x5kVdS8xpFXRzM27+8ekWGaDv+
	Sm3S6iEPKkonVvckR7OQ2P7oLmCmpADZGkM5s/IvJJQ==
X-Gm-Gg: AYBFou3RgtJv4ECkCjTgpj+ePGQPc+x3fglg2pRasWtmiUb9c65jN+ElfH9PPpJ/Ds0
	TtDo+IPuZR/65lmkpqmWvbwPV9soeq7jwSid906HCsaHUuY9Qs2vnqB/SPYMTJ5ZElzNusDcPj8
	Q6rcTJcVdKLw3idUKtR6yP9SUra7EHsJ6QVh+ehZtPjrONjdIMi9WmeMrs0z5ZVZ7Jyx36dFwQ3
	csJGjc2ysWw+y1hSbDlfpqlP9+z6WX/WAFSSiewx1fvyXjQkVeljv4sdx9eBMLCYvrMKMrPcIV+
	egKPRTBuT8LFhhtaOsXi+Y8umqM8jpTJhUbpOFkO9Aq60gWn1+mF24JJ1hQgnAVUE5o/zJDSz9T
	LfZUBuTV8qbOd7A==
X-Received: by 2002:a05:6402:518b:b0:6a7:f7f3:66d4 with SMTP id
 4fb4d7f45d1cf-6a9f63d1831mr4622791a12.24.1789483119518; Tue, 15 Sep 2026
 07:38:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260831070349epcas5p4c62a4e46592dffe95723ddd51a6068e0@epcas5p4.samsung.com>
 <20260831070309.158069-1-selvarasu.g@samsung.com>
In-Reply-To: <20260831070309.158069-1-selvarasu.g@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 15 Sep 2026 15:38:27 +0100
X-Gm-Features: AcwNN1Xw208DqxP9opmiR8ULGxXcGVSbiimmOgDikZLNDndPPFL37ybJKwgPW5Y
Message-ID: <CADrjBPq9v8brtXt0y-FJhSPMQQirkRLSK4QkcafWO+UdbBH92g@mail.gmail.com>
Subject: Re: [PATCH] phy: exynos5-usbdrd: Use dynamic phy_cfg size to prevent
 OOB access
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, krzk@kernel.org, 
	alim.akhtar@samsung.com, pritam.sutar@samsung.com, andre.draszik@linaro.org, 
	kernel@lvkasz.us, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jh0801.jung@samsung.com, dh10.jung@samsung.com, 
	akash.m5@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Aug 2026 at 08:03, Selvarasu Ganesan <selvarasu.g@samsung.com> wrote:
>
> The probe loop currently iterates using EXYNOS5_DRDPHYS_NUM (2),
> creating both UTMI and PIPE3 PHY instances regardless of the SoC
> capability. Several SoCs (Exynos2200, Exynos7870, Exynos850, Exynos990,
> and ExynosAutoV920) provide phy_cfg arrays containing only a single
> element.
>
> On these SoCs, when the loop reaches index 1, the driver reads past the
> end of the rodata array, populating the second PHY instance with garbage
> data. Since the configuration structure contains critical function
> pointers (phy_isol, phy_init, set_refclk), any subsequent access to this
> PHY instance via exynos5_usbdrd_phy_xlate could result in a kernel oops.
>
> Fix this by adding 'n_phy_cfg' to struct exynos5_usbdrd_phy_drvdata to
> store the actual size of the phy_cfg array for each SoC. Update the
> probe loop and the xlate function to bound their access against this
> value instead of the hardcoded EXYNOS5_DRDPHYS_NUM.
>
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index 8711a3b62c8e..311d1c25eb3e 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -477,6 +477,7 @@ struct exynos5_usbdrd_phy_config {
>
>  struct exynos5_usbdrd_phy_drvdata {
>         const struct exynos5_usbdrd_phy_config *phy_cfg;
> +       int n_phy_cfg;
>         const struct exynos5_usbdrd_phy_tuning **phy_tunes;
>         const struct phy_ops *phy_ops;
>         const char * const *clk_names;
> @@ -1164,7 +1165,7 @@ static struct phy *exynos5_usbdrd_phy_xlate(struct device *dev,
>  {
>         struct exynos5_usbdrd_phy *phy_drd = dev_get_drvdata(dev);
>
> -       if (WARN_ON(args->args[0] >= EXYNOS5_DRDPHYS_NUM))
> +       if (WARN_ON(args->args[0] >= phy_drd->drv_data->n_phy_cfg))
>                 return ERR_PTR(-ENODEV);
>
>         return phy_drd->phys[args->args[0]].phy;
> @@ -1993,6 +1994,7 @@ static const char * const exynos5_regulator_names[] = {
>
>  static const struct exynos5_usbdrd_phy_drvdata exynos2200_usb32drd_phy = {
>         .phy_cfg                = phy_cfg_exynos2200,
> +       .n_phy_cfg              = ARRAY_SIZE(phy_cfg_exynos2200),
>         .phy_ops                = &exynos2200_usbdrd_phy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOS2200_PHY_CTRL_USB20,
>         .clk_names              = exynos5_clk_names,
> @@ -2006,6 +2008,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos2200_usb32drd_phy = {
>
>  static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy = {
>         .phy_cfg                = phy_cfg_exynos5,
> +       .n_phy_cfg              = ARRAY_SIZE(phy_cfg_exynos5),
>         .phy_ops                = &exynos5_usbdrd_phy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOS5_USBDRD_PHY_CONTROL,
>         .pmu_offset_usbdrd1_phy = EXYNOS5420_USBDRD1_PHY_CONTROL,
> @@ -2019,6 +2022,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy = {
>
>  static const struct exynos5_usbdrd_phy_drvdata exynos5250_usbdrd_phy = {
>         .phy_cfg                = phy_cfg_exynos5,
> +       .n_phy_cfg              = ARRAY_SIZE(phy_cfg_exynos5),
>         .phy_ops                = &exynos5_usbdrd_phy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOS5_USBDRD_PHY_CONTROL,
>         .clk_names              = exynos5_clk_names,
> @@ -2031,6 +2035,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5250_usbdrd_phy = {
>
>  static const struct exynos5_usbdrd_phy_drvdata exynos5433_usbdrd_phy = {
>         .phy_cfg                = phy_cfg_exynos5,
> +       .n_phy_cfg              = ARRAY_SIZE(phy_cfg_exynos5),
>         .phy_ops                = &exynos5_usbdrd_phy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOS5_USBDRD_PHY_CONTROL,
>         .pmu_offset_usbdrd1_phy = EXYNOS5433_USBHOST30_PHY_CONTROL,
> @@ -2044,6 +2049,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos5433_usbdrd_phy = {
>
>  static const struct exynos5_usbdrd_phy_drvdata exynos7_usbdrd_phy = {
>         .phy_cfg                = phy_cfg_exynos5,
> +       .n_phy_cfg              = ARRAY_SIZE(phy_cfg_exynos5),
>         .phy_ops                = &exynos5_usbdrd_phy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOS5_USBDRD_PHY_CONTROL,
>         .clk_names              = exynos5_clk_names,
> @@ -2056,6 +2062,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos7_usbdrd_phy = {
>
>  static const struct exynos5_usbdrd_phy_drvdata exynos7870_usbdrd_phy = {
>         .phy_cfg                = phy_cfg_exynos7870,
> +       .n_phy_cfg              = ARRAY_SIZE(phy_cfg_exynos7870),
>         .phy_tunes              = exynos7870_tunes,
>         .phy_ops                = &exynos7870_usbdrd_phy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOS5_USBDRD_PHY_CONTROL,
> @@ -2069,6 +2076,7 @@ static const struct exynos5_usbdrd_phy_drvdata exynos7870_usbdrd_phy = {
>
>  static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
>         .phy_cfg                = phy_cfg_exynos850,
> +       .n_phy_cfg              = ARRAY_SIZE(phy_cfg_exynos850),
>         .phy_ops                = &exynos850_usbdrd_phy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOS5_USBDRD_PHY_CONTROL,
>         .clk_names              = exynos5_clk_names,
> @@ -2097,6 +2105,7 @@ static const struct exynos5_usbdrd_phy_tuning *exynos990_tunes[PTS_MAX] = {
>
>  static const struct exynos5_usbdrd_phy_drvdata exynos990_usbdrd_phy = {
>         .phy_cfg                = phy_cfg_exynos850,
> +       .n_phy_cfg              = ARRAY_SIZE(phy_cfg_exynos850),
>         .phy_ops                = &exynos850_usbdrd_phy_ops,
>         .phy_tunes              = exynos990_tunes,
>         .pmu_offset_usbdrd0_phy = EXYNOS990_PHY_CTRL_USB20,
> @@ -2629,6 +2638,7 @@ static const struct phy_ops exynosautov920_usb31drd_combo_ssphy_ops = {
>  static const
>  struct exynos5_usbdrd_phy_drvdata exynosautov920_usb31drd_combo_ssphy = {
>         .phy_cfg                = usb31drd_phy_cfg_exynosautov920,
> +       .n_phy_cfg              = ARRAY_SIZE(usb31drd_phy_cfg_exynosautov920),
>         .phy_ops                = &exynosautov920_usb31drd_combo_ssphy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOSAUTOV920_PHY_CTRL_USB31,
>         .clk_names              = exynos5_clk_names,
> @@ -2659,6 +2669,7 @@ exynos5_usbdrd_phy_config usbdrd_hsphy_cfg_exynosautov920[] = {
>  static const
>  struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_combo_hsphy = {
>         .phy_cfg                = usbdrd_hsphy_cfg_exynosautov920,
> +       .n_phy_cfg              = ARRAY_SIZE(usbdrd_hsphy_cfg_exynosautov920),
>         .phy_ops                = &exynosautov920_usbdrd_combo_hsphy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOSAUTOV920_PHY_CTRL_USB20,
>         .clk_names              = exynos5_clk_names,
> @@ -2687,6 +2698,7 @@ static const struct exynos5_usbdrd_phy_config phy_cfg_exynosautov920[] = {
>
>  static const struct exynos5_usbdrd_phy_drvdata exynosautov920_usbdrd_phy = {
>         .phy_cfg                = phy_cfg_exynosautov920,
> +       .n_phy_cfg              = ARRAY_SIZE(phy_cfg_exynosautov920),
>         .phy_ops                = &exynosautov920_usbdrd_phy_ops,
>         .pmu_offset_usbdrd0_phy = EXYNOSAUTOV920_PHY_CTRL_USB20,
>         .clk_names              = exynos5_clk_names,
> @@ -2863,6 +2875,7 @@ static const char * const gs101_regulator_names[] = {
>
>  static const struct exynos5_usbdrd_phy_drvdata gs101_usbd31rd_phy = {
>         .phy_cfg                        = phy_cfg_gs101,
> +       .n_phy_cfg                      = ARRAY_SIZE(phy_cfg_gs101),
>         .phy_tunes                      = gs101_tunes,
>         .phy_ops                        = &gs101_usbdrd_phy_ops,
>         .pmu_offset_usbdrd0_phy         = GS101_PHY_CTRL_USB20,
> @@ -3020,7 +3033,7 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
>
>         dev_vdbg(dev, "Creating usbdrd_phy phy\n");
>
> -       for (i = 0; i < EXYNOS5_DRDPHYS_NUM; i++) {
> +       for (i = 0; i < drv_data->n_phy_cfg; i++) {
>                 struct phy *phy = devm_phy_create(dev, NULL, drv_data->phy_ops);
>
>                 if (IS_ERR(phy))
> --
> 2.17.1
>
