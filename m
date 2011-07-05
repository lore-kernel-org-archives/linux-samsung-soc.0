From: Sangwook Lee <sangwook.lee@linaro.org>
Subject: Re: [PATCH 5/7] ARM: EXYNOS4: Use generic DMA PL330 driver
Date: Tue, 5 Jul 2011 09:30:31 +0100
Message-ID: <CADPsn1aAhs=DueizDFNCrS4Acxy7SEYtM66ZNKcmVwC5XcdsUA@mail.gmail.com>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com>
	<1309781915-31549-6-git-send-email-kgene.kim@samsung.com>
	<CAGOxZ50-L9X-aGwdi7XyGpJhS-GENmk6Q7XwyD85=OJzs7Juqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:59156 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753869Ab1GEIac convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2011 04:30:32 -0400
Received: by pvg12 with SMTP id 12so4945574pvg.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jul 2011 01:30:31 -0700 (PDT)
In-Reply-To: <CAGOxZ50-L9X-aGwdi7XyGpJhS-GENmk6Q7XwyD85=OJzs7Juqg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Grant Likely <grant.likely@secretlab.ca>, Jassi Brar <jassisinghbrar@gmail.com>, Liam Girdwood <lrg@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Boojin Kim <boojin.kim@samsung.com>

>> @@ -47,6 +47,11 @@ static struct clk clk_sclk_usbphy1 =3D {
>> =A0 =A0 =A0 =A0.id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> =A0};
>>
>> +static struct clk dummy_apb_pclk =3D {
>> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "apb_pclk",
>> + =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> +};
>> +
> What is the need to=A0creating "dummy_apb_pclk"=A0?

I guess this is right, because amba device should call amba_device_reig=
ster and
this function requires apb_pclk, even if that is dummy clock.

>>
>> =A0static int exynos4_clksrc_mask_top_ctrl(struct clk *clk, int enab=
le)
