Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BBA2FB0BB
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 08:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763108781; cv=none; b=pJmow3HBm5Y040HgxQtYuZwv3iBDz+vDRAWp4e3yhwcrN2HnYPeWJIMMLxjID/Jvgk2gRM3smuzAYF/l5vRuYTEv+rCXZ0zSfalHymlU+fqXKR4aW9d4awsQpuyyCDrGLjg6mgQp/Y9YLrJzq/wO742484LSEc7WETB33ipjy8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763108781; c=relaxed/simple;
	bh=GCBvaAWFCOdQLheHzjyb/P+Ek2lW98MbXeqY6+t7mBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=Drnc/uQqQZZ6tLCfXU7BoFkjm5qTUykbM1lQhEym1ppWXebNLHjJYDRRpJRm0V3/ukVOGO7t1jEbcp/3UGkFVy8KucjA2Bi8Ehh+zCKg+gl2x/dNJ4YqnBjrmc6c03Ga6kmGYsy6Vn4Z8HXSaHmwAv140YkuJB6mOhDdrbfroL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=WAwTvztx; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="WAwTvztx"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251114082612epoutp028ada33348007c49bec5ab4d27636c036~30hZvCo4F0844008440epoutp02Z
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 08:26:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251114082612epoutp028ada33348007c49bec5ab4d27636c036~30hZvCo4F0844008440epoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763108772;
	bh=88aFx1S8/H2fT1kitCFpjEy234xZ1Wo4NL6Ecp8xHxw=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=WAwTvztxpp6MDcQhhYfyEL/JUepOC4TnLzrVdVKYLKmvvCPzhnb5j0fUDVl0DrH/z
	 wFNluNvvYA5KkV3vQQwyYRwE3BhLtbbnmxVR1ZImZ7jGm+NWKHoeufI+UsaATDsDcM
	 PdJq5/mMGXz+v0EjjvbXnIELoAW+eTDR4A/jP/Tw=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20251114082612epcas2p3a2be50e0b79cdb445e1415dce40b11d6~30hZTV8-v3168631686epcas2p3G;
	Fri, 14 Nov 2025 08:26:12 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.212]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4d79Fw0qLDz2SSKm; Fri, 14 Nov
	2025 08:26:12 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20251114082611epcas2p13a955ba60333d917de355e8b42aff9f9~30hYayJtW1643016430epcas2p1p;
	Fri, 14 Nov 2025 08:26:11 +0000 (GMT)
Received: from [12.36.160.98] (unknown [12.36.160.98]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251114082611epsmtip2083c151004198b8e2fdafa733fa1a77c~30hYXH4GB2709527095epsmtip2V;
	Fri, 14 Nov 2025 08:26:11 +0000 (GMT)
Message-ID: <03e9c44c-1dbd-4cbe-8e5e-7022218b99f6@samsung.com>
Date: Fri, 14 Nov 2025 17:27:26 +0900
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH v1 4/5] pinctrl: samsung: exynos: fold GS101
 pin-bank macros into EXYNOS9_*
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, peter.griffin@linaro.org, ryu.real@samsung.com,
	d7271.choe@samsung.com, linux-samsung-soc@vger.kernel.org
Content-Language: en-US
From: Youngmin Nam <youngmin.nam@samsung.com>
In-Reply-To: <CAPLW+4mQQ=fWAxD4yBYan4fUEOBTJ-k0K6zNjoULi9X4MjOe8w@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251114082611epcas2p13a955ba60333d917de355e8b42aff9f9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251110082143epcas2p264578c49f1ac241c3ae721d5e23149ff
References: <CGME20251110082143epcas2p264578c49f1ac241c3ae721d5e23149ff@epcas2p2.samsung.com>
	<20251110082649.3109858-1-youngmin.nam@samsung.com>
	<20251110082649.3109858-5-youngmin.nam@samsung.com>
	<CAPLW+4mQQ=fWAxD4yBYan4fUEOBTJ-k0K6zNjoULi9X4MjOe8w@mail.gmail.com>

On 11/13/25 11:24, Sam Protsenko wrote:
> On Mon, Nov 10, 2025 at 2:21 AM Youngmin Nam <youngmin.nam@samsung.com> wrote:
>>
>> GS101 had dedicated GS101_PIN_BANK_EINT{G,W} helpers,
> 
> Style: please make line as long as possible (AFAIR the limit for
> commit messages is 72 characters). And no UTF-8 characters, if
> possible. This goes for all patches.
> 
Ack.

>> but they are redundant with EXYNOS9_PIN_BANK_EINT{G,W} (same semantics,
>> including the per-bank .eint_fltcon_offset).
>> This change removes the GS101_* macros and
>> switches the GS101 pin-bank tables to the EXYNOS9_* helpers
>> with exynos9_bank_type_{alive,off}.
>> While here, update the struct comment to note
>> FLTCON is Exynos9-specific (not “GS101-specific”).
>>
>> One macro family for all Exynos9-era SoCs (incl. GS101) reduces
>> copy-paste drift and keeps the FLTCON handling consistent.
>> There is no functional change.
>>
>> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
>> ---
> 
> LGTM:
> 
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
> 
Thank you.

>>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 98 +++++++++----------
>>  drivers/pinctrl/samsung/pinctrl-exynos.h      | 22 -----
>>  drivers/pinctrl/samsung/pinctrl-samsung.h     |  4 +-
>>  3 files changed, 51 insertions(+), 73 deletions(-)
>>
>> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
>> index d4b2e9f8baef..ea11543e4e26 100644
>> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
>> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
>> @@ -1842,83 +1842,83 @@ const struct samsung_pinctrl_of_match_data fsd_of_data __initconst = {
>>
>>  /* pin banks of gs101 pin-controller (ALIVE) */
>>  static const struct samsung_pin_bank_data gs101_pin_alive[] = {
>> -       GS101_PIN_BANK_EINTW(8, 0x0, "gpa0", 0x00, 0x00),
>> -       GS101_PIN_BANK_EINTW(7, 0x20, "gpa1", 0x04, 0x08),
>> -       GS101_PIN_BANK_EINTW(5, 0x40, "gpa2", 0x08, 0x10),
>> -       GS101_PIN_BANK_EINTW(4, 0x60, "gpa3", 0x0c, 0x18),
>> -       GS101_PIN_BANK_EINTW(4, 0x80, "gpa4", 0x10, 0x1c),
>> -       GS101_PIN_BANK_EINTW(7, 0xa0, "gpa5", 0x14, 0x20),
>> -       GS101_PIN_BANK_EINTW(8, 0xc0, "gpa9", 0x18, 0x28),
>> -       GS101_PIN_BANK_EINTW(2, 0xe0, "gpa10", 0x1c, 0x30),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x0, "gpa0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 7, 0x20, "gpa1", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 5, 0x40, "gpa2", 0x08, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 4, 0x60, "gpa3", 0x0c, 0x18),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 4, 0x80, "gpa4", 0x10, 0x1c),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 7, 0xa0, "gpa5", 0x14, 0x20),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0xc0, "gpa9", 0x18, 0x28),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0xe0, "gpa10", 0x1c, 0x30),
> 
> As mentioned before, please try to keep the lines at 80 characters max.
> 
>>  };
>>
>>  /* pin banks of gs101 pin-controller (FAR_ALIVE) */
>>  static const struct samsung_pin_bank_data gs101_pin_far_alive[] = {
>> -       GS101_PIN_BANK_EINTW(8, 0x0, "gpa6", 0x00, 0x00),
>> -       GS101_PIN_BANK_EINTW(4, 0x20, "gpa7", 0x04, 0x08),
>> -       GS101_PIN_BANK_EINTW(8, 0x40, "gpa8", 0x08, 0x0c),
>> -       GS101_PIN_BANK_EINTW(2, 0x60, "gpa11", 0x0c, 0x14),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x0, "gpa6", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 4, 0x20, "gpa7", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x40, "gpa8", 0x08, 0x0c),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x60, "gpa11", 0x0c, 0x14),
>>  };
>>
>>  /* pin banks of gs101 pin-controller (GSACORE) */
>>  static const struct samsung_pin_bank_data gs101_pin_gsacore[] = {
>> -       GS101_PIN_BANK_EINTG(2, 0x0, "gps0", 0x00, 0x00),
>> -       GS101_PIN_BANK_EINTG(8, 0x20, "gps1", 0x04, 0x04),
>> -       GS101_PIN_BANK_EINTG(3, 0x40, "gps2", 0x08, 0x0c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x0, "gps0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x20, "gps1", 0x04, 0x04),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x40, "gps2", 0x08, 0x0c),
>>  };
>>
>>  /* pin banks of gs101 pin-controller (GSACTRL) */
>>  static const struct samsung_pin_bank_data gs101_pin_gsactrl[] = {
>> -       GS101_PIN_BANK_EINTW(6, 0x0, "gps3", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 6, 0x0, "gps3", 0x00, 0x00),
>>  };
>>
>>  /* pin banks of gs101 pin-controller (PERIC0) */
>>  static const struct samsung_pin_bank_data gs101_pin_peric0[] = {
>> -       GS101_PIN_BANK_EINTG(5, 0x0, "gpp0", 0x00, 0x00),
>> -       GS101_PIN_BANK_EINTG(4, 0x20, "gpp1", 0x04, 0x08),
>> -       GS101_PIN_BANK_EINTG(4, 0x40, "gpp2", 0x08, 0x0c),
>> -       GS101_PIN_BANK_EINTG(2, 0x60, "gpp3", 0x0c, 0x10),
>> -       GS101_PIN_BANK_EINTG(4, 0x80, "gpp4", 0x10, 0x14),
>> -       GS101_PIN_BANK_EINTG(2, 0xa0, "gpp5", 0x14, 0x18),
>> -       GS101_PIN_BANK_EINTG(4, 0xc0, "gpp6", 0x18, 0x1c),
>> -       GS101_PIN_BANK_EINTG(2, 0xe0, "gpp7", 0x1c, 0x20),
>> -       GS101_PIN_BANK_EINTG(4, 0x100, "gpp8", 0x20, 0x24),
>> -       GS101_PIN_BANK_EINTG(2, 0x120, "gpp9", 0x24, 0x28),
>> -       GS101_PIN_BANK_EINTG(4, 0x140, "gpp10", 0x28, 0x2c),
>> -       GS101_PIN_BANK_EINTG(2, 0x160, "gpp11", 0x2c, 0x30),
>> -       GS101_PIN_BANK_EINTG(4, 0x180, "gpp12", 0x30, 0x34),
>> -       GS101_PIN_BANK_EINTG(2, 0x1a0, "gpp13", 0x34, 0x38),
>> -       GS101_PIN_BANK_EINTG(4, 0x1c0, "gpp14", 0x38, 0x3c),
>> -       GS101_PIN_BANK_EINTG(2, 0x1e0, "gpp15", 0x3c, 0x40),
>> -       GS101_PIN_BANK_EINTG(4, 0x200, "gpp16", 0x40, 0x44),
>> -       GS101_PIN_BANK_EINTG(2, 0x220, "gpp17", 0x44, 0x48),
>> -       GS101_PIN_BANK_EINTG(4, 0x240, "gpp18", 0x48, 0x4c),
>> -       GS101_PIN_BANK_EINTG(4, 0x260, "gpp19", 0x4c, 0x50),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x0, "gpp0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpp1", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x40, "gpp2", 0x08, 0x0c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x60, "gpp3", 0x0c, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x80, "gpp4", 0x10, 0x14),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xa0, "gpp5", 0x14, 0x18),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0xc0, "gpp6", 0x18, 0x1c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xe0, "gpp7", 0x1c, 0x20),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x100, "gpp8", 0x20, 0x24),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x120, "gpp9", 0x24, 0x28),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x140, "gpp10", 0x28, 0x2c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x160, "gpp11", 0x2c, 0x30),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x180, "gpp12", 0x30, 0x34),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x1a0, "gpp13", 0x34, 0x38),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x1c0, "gpp14", 0x38, 0x3c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x1e0, "gpp15", 0x3c, 0x40),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x200, "gpp16", 0x40, 0x44),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x220, "gpp17", 0x44, 0x48),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x240, "gpp18", 0x48, 0x4c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x260, "gpp19", 0x4c, 0x50),
>>  };
>>
>>  /* pin banks of gs101 pin-controller (PERIC1) */
>>  static const struct samsung_pin_bank_data gs101_pin_peric1[] = {
>> -       GS101_PIN_BANK_EINTG(8, 0x0, "gpp20", 0x00, 0x00),
>> -       GS101_PIN_BANK_EINTG(4, 0x20, "gpp21", 0x04, 0x08),
>> -       GS101_PIN_BANK_EINTG(2, 0x40, "gpp22", 0x08, 0x0c),
>> -       GS101_PIN_BANK_EINTG(8, 0x60, "gpp23", 0x0c, 0x10),
>> -       GS101_PIN_BANK_EINTG(4, 0x80, "gpp24", 0x10, 0x18),
>> -       GS101_PIN_BANK_EINTG(4, 0xa0, "gpp25", 0x14, 0x1c),
>> -       GS101_PIN_BANK_EINTG(5, 0xc0, "gpp26", 0x18, 0x20),
>> -       GS101_PIN_BANK_EINTG(4, 0xe0, "gpp27", 0x1c, 0x28),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0, "gpp20", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpp21", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x40, "gpp22", 0x08, 0x0c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x60, "gpp23", 0x0c, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x80, "gpp24", 0x10, 0x18),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0xa0, "gpp25", 0x14, 0x1c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0xc0, "gpp26", 0x18, 0x20),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0xe0, "gpp27", 0x1c, 0x28),
>>  };
>>
>>  /* pin banks of gs101 pin-controller (HSI1) */
>>  static const struct samsung_pin_bank_data gs101_pin_hsi1[] = {
>> -       GS101_PIN_BANK_EINTG(6, 0x0, "gph0", 0x00, 0x00),
>> -       GS101_PIN_BANK_EINTG(7, 0x20, "gph1", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x0, "gph0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x20, "gph1", 0x04, 0x08),
>>  };
>>
>>  /* pin banks of gs101 pin-controller (HSI2) */
>>  static const struct samsung_pin_bank_data gs101_pin_hsi2[] = {
>> -       GS101_PIN_BANK_EINTG(6, 0x0, "gph2", 0x00, 0x00),
>> -       GS101_PIN_BANK_EINTG(2, 0x20, "gph3", 0x04, 0x08),
>> -       GS101_PIN_BANK_EINTG(6, 0x40, "gph4", 0x08, 0x0c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x0, "gph2", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x20, "gph3", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x40, "gph4", 0x08, 0x0c),
>>  };
>>
>>  static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
>> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
>> index c0f4639dbb0e..476346d163d8 100644
>> --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
>> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
>> @@ -187,28 +187,6 @@
>>                 .name                   = id                            \
>>         }
>>
>> -#define GS101_PIN_BANK_EINTG(pins, reg, id, offs, fltcon_offs) \
>> -       {                                                       \
>> -               .type                   = &exynos9_bank_type_off,       \
>> -               .pctl_offset            = reg,                  \
>> -               .nr_pins                = pins,                 \
>> -               .eint_type              = EINT_TYPE_GPIO,       \
>> -               .eint_offset            = offs,                 \
>> -               .eint_fltcon_offset     = fltcon_offs,          \
>> -               .name                   = id                    \
>> -       }
>> -
>> -#define GS101_PIN_BANK_EINTW(pins, reg, id, offs, fltcon_offs) \
>> -       {                                                               \
>> -               .type                   = &exynos9_bank_type_alive,     \
>> -               .pctl_offset            = reg,                          \
>> -               .nr_pins                = pins,                         \
>> -               .eint_type              = EINT_TYPE_WKUP,               \
>> -               .eint_offset            = offs,                         \
>> -               .eint_fltcon_offset     = fltcon_offs,                  \
>> -               .name                   = id                            \
>> -       }
>> -
>>  #define ARTPEC_PIN_BANK_EINTG(pins, reg, id, offs)                     \
>>         {                                                               \
>>                 .type                   = &artpec_bank_type_off,        \
>> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
>> index 0f7b2ea98158..0209c2d28858 100644
>> --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
>> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
>> @@ -145,7 +145,7 @@ struct samsung_pin_bank_type {
>>   * @eint_con_offset: ExynosAuto SoC-specific EINT control register offset of bank.
>>   * @eint_mask_offset: ExynosAuto SoC-specific EINT mask register offset of bank.
>>   * @eint_pend_offset: ExynosAuto SoC-specific EINT pend register offset of bank.
>> - * @eint_fltcon_offset: GS101 SoC-specific EINT filter config register offset.
>> + * @eint_fltcon_offset: Exynos9 SoC-specific EINT filter config register offset.
>>   * @name: name to be prefixed for each pin in this pin bank.
>>   */
>>  struct samsung_pin_bank_data {
>> @@ -180,7 +180,7 @@ struct samsung_pin_bank_data {
>>   * @eint_con_offset: ExynosAuto SoC-specific EINT register or interrupt offset of bank.
>>   * @eint_mask_offset: ExynosAuto SoC-specific EINT mask register offset of bank.
>>   * @eint_pend_offset: ExynosAuto SoC-specific EINT pend register offset of bank.
>> - * @eint_fltcon_offset: GS101 SoC-specific EINT filter config register offset.
>> + * @eint_fltcon_offset: Exynos9 SoC-specific EINT filter config register offset.
>>   * @name: name to be prefixed for each pin in this pin bank.
>>   * @id: id of the bank, propagated to the pin range.
>>   * @pin_base: starting pin number of the bank.
>> --
>> 2.39.2
>>
> 

