Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23754271451
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 08:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763108675; cv=none; b=AYy9IpwL88A9ivIk9tMALkCE9O//+25PQuveZ4nTyGC5tufhN5oF2yxurhU+v0joxZYnEColis0PP09LNgHHoIAAeI60JmdWfQamyqeYq233bE9aFP6AYeX2fuwiIke7HdanNMuCCezYmzGh1R3vpYhaBcvzdDm3eA6LgCM4/WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763108675; c=relaxed/simple;
	bh=+rj9853/7hqYBwyx7qB47y45GDRL5qHcJ0ECpNU07MU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=ey+r7HoXgRdMlVenKhDxk/OCVMjOC23J1KXGlMjo42h8btd3zGx3ZoOLjZvpPzompXV9EHkrGxr7/xjzpDX6ORffSEVL51of7Qfu59XgsFzpao72S8ILQf6MRa4juxriQo0IZPmtzoBTgKmz7fFrR7u0fMpQRl396hqbm7l25lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=hX18XsJz; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="hX18XsJz"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251114082428epoutp049c069b64d7de09a974e899c3b2a83fa2~30f47qY9w2211222112epoutp04O
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 08:24:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251114082428epoutp049c069b64d7de09a974e899c3b2a83fa2~30f47qY9w2211222112epoutp04O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763108669;
	bh=0WV6530HSK47Qfj9dnRK/oyYQLRW6RPEs/ylKrs+JwY=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=hX18XsJzDdzWB1WH3i9ULOIecbpPSn+bwFH0b+bYH3+CwfmcdmrSVTEAlJXBzhVOs
	 IoTEByKb4WlCktpusevPe6Gmj9inAiVEJtkq3VUazf0e4oavp1NrtncjmYrDHfBwUY
	 cFBI0xQ8MuMO9Faz0Jt2AeIIL9WwXl22Ru0N0j/8=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20251114082428epcas2p4385d1d521cdbbeef7cc7c4d8217273c5~30f4Ga-NL1693216932epcas2p4h;
	Fri, 14 Nov 2025 08:24:28 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.38.201]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4d79Cv5Ht7z6B9mF; Fri, 14 Nov
	2025 08:24:27 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20251114082427epcas2p235464adefd811097acd55ac44d74ee56~30f3N4iSn1489514895epcas2p2Q;
	Fri, 14 Nov 2025 08:24:27 +0000 (GMT)
Received: from [12.36.160.98] (unknown [12.36.160.98]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251114082427epsmtip2fe02261201d147a481600ab449683a0e~30f3Jfwke2440624406epsmtip21;
	Fri, 14 Nov 2025 08:24:27 +0000 (GMT)
Message-ID: <65a66534-b088-4885-9f43-27b9e942c168@samsung.com>
Date: Fri, 14 Nov 2025 17:25:42 +0900
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH v1 3/5] pinctrl: samsung: add per-bank FLTCON offset
 to EXYNOS9_PIN_BANK_* and fix tables
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, peter.griffin@linaro.org, ryu.real@samsung.com,
	d7271.choe@samsung.com, linux-samsung-soc@vger.kernel.org
Content-Language: en-US
From: Youngmin Nam <youngmin.nam@samsung.com>
In-Reply-To: <CAPLW+4kBseE6bWx406W3Uye=8-_2QT-FZ_AyfYUzKn8vNukmcw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251114082427epcas2p235464adefd811097acd55ac44d74ee56
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251110082142epcas2p367ab78c8dc9f74664b2773d918e9c4ab
References: <CGME20251110082142epcas2p367ab78c8dc9f74664b2773d918e9c4ab@epcas2p3.samsung.com>
	<20251110082649.3109858-1-youngmin.nam@samsung.com>
	<20251110082649.3109858-4-youngmin.nam@samsung.com>
	<CAPLW+4kBseE6bWx406W3Uye=8-_2QT-FZ_AyfYUzKn8vNukmcw@mail.gmail.com>

On 11/13/25 11:17, Sam Protsenko wrote:
> On Mon, Nov 10, 2025 at 2:21 AM Youngmin Nam <youngmin.nam@samsung.com> wrote:
>>
>> Several Exynos9-era pin-bank tables were implicitly assuming that the
>> filter control (FLTCON) registers are laid out contiguously
>> from the EINT base offset. Per the TRMs this is not always true. FLTCON
>> can live at a separate per-bank offset, and the current tables cause the
>> driver to program the wrong FLTCON addresses for some banks.
>>
>> - Extends EXYNOS9_PIN_BANK_EINTG()/EINTW() to take an explicit
>>   .eint_fltcon_offset parameter.
>> - Updates pin-bank tables with the correct FLTCON offsets for:
>>   Exynos2200 (ALIVE/CMGP/HSI1/UFS/HSI1UFS/PERIC0/1/2/VTS),
>>   Exynos7870 (ALIVE/DISPAUD/ESE/FSYS/MIF/NFC/TOP/TOUCH),
>>   Exynos7885 (ALIVE/DISPAUD/FSYS/TOP),
>>   Exynos850  (ALIVE/CMGP/AUD/HSI/CORE/PERI),
>>   Exynos990  (ALIVE/CMGP/HSI1/HSI2/PERIC0/1/VTS),
>>   Exynos9810 (ALIVE/AUD/CHUB/CMGP/FSYS0/FSYS1/PERIC0/1/VTS),
>>   ExynosAuto v9 (ALIVE/AUD/FSYS0/1/2/PERIC0/1),
>>   Exynos8890 (ALIVE/AUD/CCORE/ESE/FP/FSYS0/1/NFC/PERIC0/1/TOUCH),
>>   Exynos8895 (ALIVE/ABOX/VTS/FSYS0/1/BUSC/PERIC0/1),
>>   and FSD (FSYS/PERIC).
>>
>> Notes:
>> - GS101 already programs per-bank filter control registers. This change
>>   aligns the Exynos9 path with that model.
>> - Banks without filters (EINTN) are unaffected.
>>
>> Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> 
> If this patch actually fixes some incorrect behavior, suggest adding
> the "Fixes:" tag.
> 
>> ---
> 
> Just noticed that linux-kernel mailing list is not present in your To:
> and Cc:. For future, please make sure to use the
> scripts/get_maintainer.pl output for submission, or use 'b4 prep
> --auto-to-cc' if you're using 'b4' tool. This goes for the whole
> series.
> 
> The patch itself looks good to me (spotted only some minor style issues):
> 
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
> 
Ack. Let me add the mailing list correctly. Thank you.

>>  .../pinctrl/saexynos2200_pin_banks5[]msung/pinctrl-exynos-arm64.c    | 744 +++++++++---------
>>  drivers/pinctrl/samsung/pinctrl-exynos.h      |  30 +-
>>  2 files changed, 388 insertions(+), 386 deletions(-)
>>
>> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
>> index 6e874ce40ff5..d4b2e9f8baef 100644
>> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
>> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
>> @@ -90,11 +90,11 @@ static atomic_t exynos_shared_retention_refcnt;
>>
>>  /* pin banks of exynos2200 pin-controller - ALIVE */
>>  static const struct samsung_pin_bank_data exynos2200_pin_banks0[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x0, "gpa0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x20, "gpa1", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x40, "gpa2", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x60, "gpa3", 0x0c),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x80, "gpa4", 0x10),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x0, "gpa0", 0x00, 0x00),
> 
> As mentioned in comments for the previous patches, please try to limit
> the lines to 80 characters max when possible.
> 
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x20, "gpa1", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x40, "gpa2", 0x08, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x60, "gpa3", 0x0c, 0x18),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x80, "gpa4", 0x10, 0x20),
>>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 4, 0xa0, "gpq0"),
>>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0xc0, "gpq1"),
>>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0xe0, "gpq2"),
>> @@ -102,90 +102,90 @@ static const struct samsung_pin_bank_data exynos2200_pin_banks0[] __initconst =
>>
>>  /* pin banks of exynos2200 pin-controller - CMGP */
>>  static const struct samsung_pin_bank_data exynos2200_pin_banks1[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x0, "gpm0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x20, "gpm1", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x40, "gpm2", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x60, "gpm3", 0x0c),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x80, "gpm4", 0x10),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0xa0, "gpm5", 0x14),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0xc0, "gpm6", 0x18),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0xe0, "gpm7", 0x1c),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x100, "gpm8", 0x20),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x120, "gpm9", 0x24),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x140, "gpm10", 0x28),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x160, "gpm11", 0x2c),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x180, "gpm12", 0x30),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x1a0, "gpm13", 0x34),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1c0, "gpm14", 0x38),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1e0, "gpm15", 0x3c),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x200, "gpm16", 0x40),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x220, "gpm17", 0x44),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x240, "gpm20", 0x48),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x260, "gpm21", 0x4c),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x280, "gpm22", 0x50),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2a0, "gpm23", 0x54),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2c0, "gpm24", 0x58),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x0, "gpm0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x20, "gpm1", 0x04, 0x04),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x40, "gpm2", 0x08, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x60, "gpm3", 0x0c, 0x0c),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x80, "gpm4", 0x10, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0xa0, "gpm5", 0x14, 0x14),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0xc0, "gpm6", 0x18, 0x18),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0xe0, "gpm7", 0x1c, 0x1c),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x100, "gpm8", 0x20, 0x20),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x120, "gpm9", 0x24, 0x24),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x140, "gpm10", 0x28, 0x28),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x160, "gpm11", 0x2c, 0x2c),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x180, "gpm12", 0x30, 0x30),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x1a0, "gpm13", 0x34, 0x34),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1c0, "gpm14", 0x38, 0x38),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1e0, "gpm15", 0x3c, 0x3c),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x200, "gpm16", 0x40, 0x40),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x220, "gpm17", 0x44, 0x44),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x240, "gpm20", 0x48, 0x48),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x260, "gpm21", 0x4c, 0x4c),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x280, "gpm22", 0x50, 0x50),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2a0, "gpm23", 0x54, 0x54),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2c0, "gpm24", 0x58, 0x58),
>>  };
>>
>>  /* pin banks of exynos2200 pin-controller - HSI1 */
>>  static const struct samsung_pin_bank_data exynos2200_pin_banks2[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0, "gpf0", 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0, "gpf0", 0x00, 0x00),
>>  };
>>
>>  /* pin banks of exynos2200 pin-controller - UFS */
>>  static const struct samsung_pin_bank_data exynos2200_pin_banks3[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x0, "gpf1", 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x0, "gpf1", 0x00, 0x00),
>>  };
>>
>>  /* pin banks of exynos2200 pin-controller - HSI1UFS */
>>  static const struct samsung_pin_bank_data exynos2200_pin_banks4[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x0, "gpf2", 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x0, "gpf2", 0x00, 0x00),
>>  };
>>
>>  /* pin banks of exynos2200 pin-controller - PERIC0 */
>>  static const struct samsung_pin_bank_data exynos2200_pin_banks5[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0, "gpb0",  0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpb1",  0x04),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x40, "gpb2",  0x08),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x60, "gpb3",  0x0c),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x80, "gpp4",  0x10),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xa0, "gpc0",  0x14),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xc0, "gpc1",  0x18),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xe0, "gpc2",  0x1c),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x100, "gpg1",  0x20),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x120, "gpg2",  0x24),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0, "gpb0",  0x00, 0x00),
> 
> Style: spotted double spaces (here and below). I know it was already
> like that, but why not make it pretty while at it :)
> 
Ack.

>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpb1",  0x04, 0x04),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x40, "gpb2",  0x08, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x60, "gpb3",  0x0c, 0x0c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x80, "gpp4",  0x10, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xa0, "gpc0",  0x14, 0x14),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xc0, "gpc1",  0x18, 0x18),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xe0, "gpc2",  0x1c, 0x1c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x100, "gpg1",  0x20, 0x20),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x120, "gpg2",  0x24, 0x24),
>>  };
>>
>>  /* pin banks of exynos2200 pin-controller - PERIC1 */
>>  static const struct samsung_pin_bank_data exynos2200_pin_banks6[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0,  "gpp7",  0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpp8",  0x04),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x40, "gpp9",  0x08),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x60, "gpp10", 0x0c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0,  "gpp7",  0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpp8",  0x04, 0x04),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x40, "gpp9",  0x08, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x60, "gpp10", 0x0c, 0x0c),
>>  };
>>
>>  /* pin banks of exynos2200 pin-controller - PERIC2 */
>>  static const struct samsung_pin_bank_data exynos2200_pin_banks7[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0, "gpp0",  0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpp1",  0x04),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x40, "gpp2",  0x08),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x60, "gpp3",  0x0c),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x80, "gpp5",  0x10),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0xa0, "gpp6",  0x14),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0xc0, "gpp11", 0x18),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xe0, "gpc3",  0x1c),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x100, "gpc4",  0x20),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x120, "gpc5",  0x24),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x140, "gpc6",  0x28),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x160, "gpc7",  0x2c),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x180, "gpc8",  0x30),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x1a0, "gpc9",  0x34),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x1c0, "gpg0",  0x38),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0, "gpp0",  0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x20, "gpp1",  0x04, 0x04),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x40, "gpp2",  0x08, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x60, "gpp3",  0x0c, 0x0c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x80, "gpp5",  0x10, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0xa0, "gpp6",  0x14, 0x14),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0xc0, "gpp11", 0x18, 0x18),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0xe0, "gpc3",  0x1c, 0x1c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x100, "gpc4",  0x20, 0x20),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x120, "gpc5",  0x24, 0x24),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x140, "gpc6",  0x28, 0x28),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x160, "gpc7",  0x2c, 0x2c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x180, "gpc8",  0x30, 0x30),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x1a0, "gpc9",  0x34, 0x34),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x1c0, "gpg0",  0x38, 0x38),
>>  };
>>
>>  /* pin banks of exynos2200 pin-controller - VTS */
>>  static const struct samsung_pin_bank_data exynos2200_pin_banks8[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x0, "gpv0", 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x0, "gpv0", 0x00, 0x00),
>>  };
>>
>>  static const struct samsung_pin_ctrl exynos2200_pin_ctrl[] = {
>> @@ -640,68 +640,68 @@ const struct samsung_pinctrl_of_match_data exynos7_of_data __initconst = {
>>  static const struct samsung_pin_bank_data exynos7870_pin_banks0[] __initconst = {
>>         EXYNOS9_PIN_BANK_EINTN(exynos7870_bank_type_alive, 6, 0x000, "etc0"),
>>         EXYNOS9_PIN_BANK_EINTN(exynos7870_bank_type_alive, 3, 0x020, "etc1"),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x040, "gpa0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x060, "gpa1", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x080, "gpa2", 0x08),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x040, "gpa0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x060, "gpa1", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x080, "gpa2", 0x08, 0x10),
>>         EXYNOS9_PIN_BANK_EINTN(exynos7870_bank_type_alive, 2, 0x0c0, "gpq0"),
>>  };
>>
>>  /* pin banks of exynos7870 pin-controller 1 (DISPAUD) */
>>  static const struct samsung_pin_bank_data exynos7870_pin_banks1[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpz0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x020, "gpz1", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x040, "gpz2", 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpz0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x020, "gpz1", 0x04, 0x04),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x040, "gpz2", 0x08, 0x0c),
>>  };
>>
>>  /* pin banks of exynos7870 pin-controller 2 (ESE) */
>>  static const struct samsung_pin_bank_data exynos7870_pin_banks2[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x000, "gpc7", 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x000, "gpc7", 0x00, 0x00),
>>  };
>>
>>  /* pin banks of exynos7870 pin-controller 3 (FSYS) */
>>  static const struct samsung_pin_bank_data exynos7870_pin_banks3[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpr0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpr1", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x040, "gpr2", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpr3", 0x0c),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x080, "gpr4", 0x10),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpr0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpr1", 0x04, 0x04),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x040, "gpr2", 0x08, 0x0c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpr3", 0x0c, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x080, "gpr4", 0x10, 0x14),
>>  };
>>
>>  /* pin banks of exynos7870 pin-controller 4 (MIF) */
>>  static const struct samsung_pin_bank_data exynos7870_pin_banks4[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x000, "gpm0", 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x000, "gpm0", 0x00, 0x00),
>>  };
>>
>>  /* pin banks of exynos7870 pin-controller 5 (NFC) */
>>  static const struct samsung_pin_bank_data exynos7870_pin_banks5[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpc2", 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpc2", 0x00, 0x00),
>>  };
>>
>>  /* pin banks of exynos7870 pin-controller 6 (TOP) */
>>  static const struct samsung_pin_bank_data exynos7870_pin_banks6[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpb0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x020, "gpc0", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x040, "gpc1", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpc4", 0x0c),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x080, "gpc5", 0x10),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x0a0, "gpc6", 0x14),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0c0, "gpc8", 0x18),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0e0, "gpc9", 0x1c),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x100, "gpd1", 0x20),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x120, "gpd2", 0x24),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x140, "gpd3", 0x28),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x160, "gpd4", 0x2c),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x1a0, "gpe0", 0x34),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x1c0, "gpf0", 0x38),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x1e0, "gpf1", 0x3c),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x200, "gpf2", 0x40),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x220, "gpf3", 0x44),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x240, "gpf4", 0x48),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpb0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x020, "gpc0", 0x04, 0x04),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x040, "gpc1", 0x08, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpc4", 0x0c, 0x0c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x080, "gpc5", 0x10, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x0a0, "gpc6", 0x14, 0x14),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0c0, "gpc8", 0x18, 0x18),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0e0, "gpc9", 0x1c, 0x1c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x100, "gpd1", 0x20, 0x20),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x120, "gpd2", 0x24, 0x28),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x140, "gpd3", 0x28, 0x30),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x160, "gpd4", 0x2c, 0x38),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x1a0, "gpe0", 0x34, 0x48),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x1c0, "gpf0", 0x38, 0x4c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x1e0, "gpf1", 0x3c, 0x50),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x200, "gpf2", 0x40, 0x54),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x220, "gpf3", 0x44, 0x58),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x240, "gpf4", 0x48, 0x5c),
>>  };
>>
>>  /* pin banks of exynos7870 pin-controller 7 (TOUCH) */
>>  static const struct samsung_pin_bank_data exynos7870_pin_banks7[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpc3", 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpc3", 0x00, 0x00),
>>  };
>>
>>  static const struct samsung_pin_ctrl exynos7870_pin_ctrl[] __initconst = {
>> @@ -770,46 +770,46 @@ const struct samsung_pinctrl_of_match_data exynos7870_of_data __initconst = {
>>  static const struct samsung_pin_bank_data exynos7885_pin_banks0[] __initconst = {
>>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x000, "etc0"),
>>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x020, "etc1"),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa1", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x080, "gpa2", 0x08),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa1", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x080, "gpa2", 0x08, 0x10),
>>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 5, 0x0a0, "gpq0"),
>>  };
>>
>>  /* pin banks of exynos7885 pin-controller 1 (DISPAUD) */
>>  static const struct samsung_pin_bank_data exynos7885_pin_banks1[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x020, "gpb1", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x040, "gpb2", 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x020, "gpb1", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x040, "gpb2", 0x08, 0x0c),
>>  };
>>
>>  /* pin banks of exynos7885 pin-controller 2 (FSYS) */
>>  static const struct samsung_pin_bank_data exynos7885_pin_banks2[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpf2", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x040, "gpf3", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x060, "gpf4", 0x0c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpf2", 0x04, 0x04),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x040, "gpf3", 0x08, 0x0c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x060, "gpf4", 0x0c, 0x14),
>>  };
>>
>>  /* pin banks of exynos7885 pin-controller 3 (TOP) */
>>  static const struct samsung_pin_bank_data exynos7885_pin_banks3[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpp0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x020, "gpg0", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpp1", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x060, "gpp2", 0x0c),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x080, "gpp3", 0x10),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x0a0, "gpp4", 0x14),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0c0, "gpp5", 0x18),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x0e0, "gpp6", 0x1c),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x100, "gpp7", 0x20),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x120, "gpp8", 0x24),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x140, "gpg1", 0x28),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x160, "gpg2", 0x2c),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x180, "gpg3", 0x30),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x1a0, "gpg4", 0x34),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x1c0, "gpc0", 0x38),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1e0, "gpc1", 0x3c),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x200, "gpc2", 0x40),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpp0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x020, "gpg0", 0x04, 0x04),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpp1", 0x08, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x060, "gpp2", 0x0c, 0x0c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x080, "gpp3", 0x10, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x0a0, "gpp4", 0x14, 0x14),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0c0, "gpp5", 0x18, 0x1c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x0e0, "gpp6", 0x1c, 0x20),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x100, "gpp7", 0x20, 0x28),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x120, "gpp8", 0x24, 0x2c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x140, "gpg1", 0x28, 0x30),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x160, "gpg2", 0x2c, 0x38),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x180, "gpg3", 0x30, 0x40),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x1a0, "gpg4", 0x34, 0x48),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x1c0, "gpc0", 0x38, 0x4c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1e0, "gpc1", 0x3c, 0x50),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x200, "gpc2", 0x40, 0x58),
>>  };
>>
>>  static const struct samsung_pin_ctrl exynos7885_pin_ctrl[] __initconst = {
>> @@ -850,59 +850,59 @@ const struct samsung_pinctrl_of_match_data exynos7885_of_data __initconst = {
>>  /* pin banks of exynos850 pin-controller 0 (ALIVE) */
>>  static const struct samsung_pin_bank_data exynos850_pin_banks0[] __initconst = {
>>         /* Must start with EINTG banks, ordered by EINT group number. */
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x000, "gpa0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x020, "gpa1", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa2", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa3", 0x0c),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 4, 0x080, "gpa4", 0x10),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x000, "gpa0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x020, "gpa1", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa2", 0x08, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa3", 0x0c, 0x18),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 4, 0x080, "gpa4", 0x10, 0x20),
>>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 3, 0x0a0, "gpq0"),
>>  };
>>
>>  /* pin banks of exynos850 pin-controller 1 (CMGP) */
>>  static const struct samsung_pin_bank_data exynos850_pin_banks1[] __initconst = {
>>         /* Must start with EINTG banks, ordered by EINT group number. */
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x000, "gpm0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x020, "gpm1", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x040, "gpm2", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x060, "gpm3", 0x0c),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x080, "gpm4", 0x10),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0a0, "gpm5", 0x14),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0c0, "gpm6", 0x18),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0e0, "gpm7", 0x1c),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x000, "gpm0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x020, "gpm1", 0x04, 0x04),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x040, "gpm2", 0x08, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x060, "gpm3", 0x0c, 0x0c),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x080, "gpm4", 0x10, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0a0, "gpm5", 0x14, 0x14),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0c0, "gpm6", 0x18, 0x18),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0e0, "gpm7", 0x1c, 0x1c),
>>  };
>>
>>  /* pin banks of exynos850 pin-controller 2 (AUD) */
>>  static const struct samsung_pin_bank_data exynos850_pin_banks2[] __initconst = {
>>         /* Must start with EINTG banks, ordered by EINT group number. */
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x020, "gpb1", 0x04),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x020, "gpb1", 0x04, 0x08),
>>  };
>>
>>  /* pin banks of exynos850 pin-controller 3 (HSI) */
>>  static const struct samsung_pin_bank_data exynos850_pin_banks3[] __initconst = {
>>         /* Must start with EINTG banks, ordered by EINT group number. */
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x000, "gpf2", 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x000, "gpf2", 0x00, 0x00),
>>  };
>>
>>  /* pin banks of exynos850 pin-controller 4 (CORE) */
>>  static const struct samsung_pin_bank_data exynos850_pin_banks4[] __initconst = {
>>         /* Must start with EINTG banks, ordered by EINT group number. */
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpf1", 0x04),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpf1", 0x04, 0x04),
>>  };
>>
>>  /* pin banks of exynos850 pin-controller 5 (PERI) */
>>  static const struct samsung_pin_bank_data exynos850_pin_banks5[] __initconst = {
>>         /* Must start with EINTG banks, ordered by EINT group number. */
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x000, "gpg0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpp0", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpp1", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x060, "gpp2", 0x0c),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpg1", 0x10),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0a0, "gpg2", 0x14),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 1, 0x0c0, "gpg3", 0x18),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x0e0, "gpc0", 0x1c),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x100, "gpc1", 0x20),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x000, "gpg0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpp0", 0x04, 0x04),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpp1", 0x08, 0x0c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x060, "gpp2", 0x0c, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpg1", 0x10, 0x14),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0a0, "gpg2", 0x14, 0x1c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 1, 0x0c0, "gpg3", 0x18, 0x24),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x0e0, "gpc0", 0x1c, 0x28),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x100, "gpc1", 0x20, 0x2c),
>>  };
>>
>>  static const struct samsung_pin_ctrl exynos850_pin_ctrl[] __initconst = {
>> @@ -946,11 +946,11 @@ const struct samsung_pinctrl_of_match_data exynos850_of_data __initconst = {
>>  /* pin banks of exynos990 pin-controller 0 (ALIVE) */
>>  static struct samsung_pin_bank_data exynos990_pin_banks0[] = {
>>         /* Must start with EINTG banks, ordered by EINT group number. */
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x000, "gpa0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x020, "gpa1", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa2", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa3", 0x0c),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x080, "gpa4", 0x10),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x000, "gpa0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x020, "gpa1", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa2", 0x08, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa3", 0x0c, 0x18),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x080, "gpa4", 0x10, 0x20),
>>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 7, 0x0A0, "gpq0"),
>>  };
>>
>> @@ -961,82 +961,82 @@ static struct samsung_pin_bank_data exynos990_pin_banks1[] = {
>>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 1, 0x020, "gpm1"),
>>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 1, 0x040, "gpm2"),
>>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 1, 0x060, "gpm3"),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x080, "gpm4", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0A0, "gpm5", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0C0, "gpm6", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0E0, "gpm7", 0x0c),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x100, "gpm8", 0x10),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x120, "gpm9", 0x14),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x140, "gpm10", 0x18),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x160, "gpm11", 0x1c),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x180, "gpm12", 0x20),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1A0, "gpm13", 0x24),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1C0, "gpm14", 0x28),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1E0, "gpm15", 0x2c),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x200, "gpm16", 0x30),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x220, "gpm17", 0x34),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x240, "gpm18", 0x38),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x260, "gpm19", 0x3c),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x280, "gpm20", 0x40),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2A0, "gpm21", 0x44),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2C0, "gpm22", 0x48),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2E0, "gpm23", 0x4c),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x300, "gpm24", 0x50),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x320, "gpm25", 0x54),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x340, "gpm26", 0x58),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x360, "gpm27", 0x5c),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x380, "gpm28", 0x60),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x3A0, "gpm29", 0x64),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x3C0, "gpm30", 0x68),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x3E0, "gpm31", 0x6c),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x400, "gpm32", 0x70),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x420, "gpm33", 0x74),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x080, "gpm4", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0A0, "gpm5", 0x04, 0x04),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0C0, "gpm6", 0x08, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0E0, "gpm7", 0x0c, 0x0c),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x100, "gpm8", 0x10, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x120, "gpm9", 0x14, 0x14),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x140, "gpm10", 0x18, 0x18),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x160, "gpm11", 0x1c, 0x1c),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x180, "gpm12", 0x20, 0x20),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1A0, "gpm13", 0x24, 0x24),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1C0, "gpm14", 0x28, 0x28),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1E0, "gpm15", 0x2c, 0x2c),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x200, "gpm16", 0x30, 0x30),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x220, "gpm17", 0x34, 0x34),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x240, "gpm18", 0x38, 0x38),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x260, "gpm19", 0x3c, 0x3c),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x280, "gpm20", 0x40, 0x40),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2A0, "gpm21", 0x44, 0x44),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2C0, "gpm22", 0x48, 0x48),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x2E0, "gpm23", 0x4c, 0x4c),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x300, "gpm24", 0x50, 0x50),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x320, "gpm25", 0x54, 0x54),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x340, "gpm26", 0x58, 0x58),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x360, "gpm27", 0x5c, 0x5c),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x380, "gpm28", 0x60, 0x60),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x3A0, "gpm29", 0x64, 0x64),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x3C0, "gpm30", 0x68, 0x68),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x3E0, "gpm31", 0x6c, 0x6c),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x400, "gpm32", 0x70, 0x70),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x420, "gpm33", 0x74, 0x74),
>>  };
>>
>>  /* pin banks of exynos990 pin-controller 2 (HSI1) */
>>  static struct samsung_pin_bank_data exynos990_pin_banks2[] = {
>>         /* Must start with EINTG banks, ordered by EINT group number. */
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpf1", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x040, "gpf2", 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpf1", 0x04, 0x04),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x040, "gpf2", 0x08, 0x0c),
>>  };
>>
>>  /* pin banks of exynos990 pin-controller 3 (HSI2) */
>>  static struct samsung_pin_bank_data exynos990_pin_banks3[] = {
>>         /* Must start with EINTG banks, ordered by EINT group number. */
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x000, "gpf3", 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x000, "gpf3", 0x00, 0x00),
>>  };
>>
>>  /* pin banks of exynos990 pin-controller 4 (PERIC0) */
>>  static struct samsung_pin_bank_data exynos990_pin_banks4[] = {
>>         /* Must start with EINTG banks, ordered by EINT group number. */
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp1", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp2", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpp3", 0x0C),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpp4", 0x10),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x0A0, "gpg0", 0x14),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp1", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp2", 0x08, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpp3", 0x0C, 0x18),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpp4", 0x10, 0x20),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x0A0, "gpg0", 0x14, 0x28),
>>  };
>>
>>  /* pin banks of exynos990 pin-controller 5 (PERIC1) */
>>  static struct samsung_pin_bank_data exynos990_pin_banks5[] = {
>>         /* Must start with EINTG banks, ordered by EINT group number. */
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp5", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp6", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp7", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpp8", 0x0C),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpp9", 0x10),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x0A0, "gpc0", 0x14),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0C0, "gpg1", 0x18),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0E0, "gpb0", 0x1C),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x100, "gpb1", 0x20),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x120, "gpb2", 0x24),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp5", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp6", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp7", 0x08, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpp8", 0x0C, 0x18),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpp9", 0x10, 0x20),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x0A0, "gpc0", 0x14, 0x28),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0C0, "gpg1", 0x18, 0x30),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0E0, "gpb0", 0x1C, 0x34),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x100, "gpb1", 0x20, 0x3c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x120, "gpb2", 0x24, 0x44),
>>  };
>>
>>  /* pin banks of exynos990 pin-controller 6 (VTS) */
>>  static struct samsung_pin_bank_data exynos990_pin_banks6[] = {
>>         /* Must start with EINTG banks, ordered by EINT group number. */
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x000, "gpv0", 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x000, "gpv0", 0x00, 0x00),
>>  };
>>
>>  static const struct samsung_pin_ctrl exynos990_pin_ctrl[] __initconst = {
>> @@ -1085,87 +1085,87 @@ const struct samsung_pinctrl_of_match_data exynos990_of_data __initconst = {
>>  /* pin banks of exynos9810 pin-controller 0 (ALIVE) */
>>  static const struct samsung_pin_bank_data exynos9810_pin_banks0[] __initconst = {
>>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 6, 0x000, "etc1"),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x020, "gpa0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa1", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa2", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x080, "gpa3", 0x0c),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x020, "gpa0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x040, "gpa1", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x060, "gpa2", 0x08, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x080, "gpa3", 0x0c, 0x18),
>>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 6, 0x0A0, "gpq0"),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x0C0, "gpa4", 0x10),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x0C0, "gpa4", 0x10, 0x20),
>>  };
>>
>>  /* pin banks of exynos9810 pin-controller 1 (AUD) */
>>  static const struct samsung_pin_bank_data exynos9810_pin_banks1[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpb1", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpb2", 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpb1", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpb2", 0x08, 0x10),
>>  };
>>
>>  /* pin banks of exynos9810 pin-controller 2 (CHUB) */
>>  static const struct samsung_pin_bank_data exynos9810_pin_banks2[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gph0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x020, "gph1", 0x04),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gph0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x020, "gph1", 0x04, 0x08),
>>  };
>>
>>  /* pin banks of exynos9810 pin-controller 3 (CMGP) */
>>  static const struct samsung_pin_bank_data exynos9810_pin_banks3[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x000, "gpm0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x020, "gpm1", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x040, "gpm2", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x060, "gpm3", 0x0C),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x080, "gpm4", 0x10),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0A0, "gpm5", 0x14),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0C0, "gpm6", 0x18),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0E0, "gpm7", 0x1C),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x100, "gpm10", 0x20),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x120, "gpm11", 0x24),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x140, "gpm12", 0x28),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x160, "gpm13", 0x2C),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x180, "gpm14", 0x30),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1A0, "gpm15", 0x34),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1C0, "gpm16", 0x38),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1E0, "gpm17", 0x3C),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x200, "gpm40", 0x40),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x220, "gpm41", 0x44),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x240, "gpm42", 0x48),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x260, "gpm43", 0x4C),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x000, "gpm0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x020, "gpm1", 0x04, 0x04),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x040, "gpm2", 0x08, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x060, "gpm3", 0x0C, 0x0c),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x080, "gpm4", 0x10, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0A0, "gpm5", 0x14, 0x14),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0C0, "gpm6", 0x18, 0x18),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x0E0, "gpm7", 0x1C, 0x1c),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x100, "gpm10", 0x20, 0x20),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x120, "gpm11", 0x24, 0x24),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x140, "gpm12", 0x28, 0x28),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x160, "gpm13", 0x2C, 0x2c),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x180, "gpm14", 0x30, 0x30),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1A0, "gpm15", 0x34, 0x34),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1C0, "gpm16", 0x38, 0x38),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x1E0, "gpm17", 0x3C, 0x3c),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x200, "gpm40", 0x40, 0x40),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x220, "gpm41", 0x44, 0x44),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x240, "gpm42", 0x48, 0x48),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 1, 0x260, "gpm43", 0x4C, 0x4c),
>>  };
>>
>>  /* pin banks of exynos9810 pin-controller 4 (FSYS0) */
>>  static const struct samsung_pin_bank_data exynos9810_pin_banks4[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x000, "gpf0", 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x000, "gpf0", 0x00, 0x00),
>>  };
>>
>>  /* pin banks of exynos9810 pin-controller 5 (FSYS1) */
>>  static const struct samsung_pin_bank_data exynos9810_pin_banks5[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x000, "gpf1", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpf2", 0x04),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x000, "gpf1", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpf2", 0x04, 0x08),
>>  };
>>
>>  /* pin banks of exynos9810 pin-controller 6 (PERIC0) */
>>  static const struct samsung_pin_bank_data exynos9810_pin_banks6[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp1", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp2", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x060, "gpp3", 0x0C),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpg0", 0x10),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0A0, "gpg1", 0x14),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0C0, "gpg2", 0x18),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp1", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp2", 0x08, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x060, "gpp3", 0x0C, 0x18),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpg0", 0x10, 0x1c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0A0, "gpg1", 0x14, 0x24),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0C0, "gpg2", 0x18, 0x2c),
>>  };
>>
>>  /* pin banks of exynos9810 pin-controller 7 (PERIC1) */
>>  static const struct samsung_pin_bank_data exynos9810_pin_banks7[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp4", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp5", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpp6", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpc0", 0x0C),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpc1", 0x10),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0A0, "gpd0", 0x14),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x0C0, "gpg3", 0x18),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp4", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp5", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x040, "gpp6", 0x08, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpc0", 0x0C, 0x14),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpc1", 0x10, 0x1c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0A0, "gpd0", 0x14, 0x24),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x0C0, "gpg3", 0x18, 0x28),
>>  };
>>
>>  /* pin banks of exynos9810 pin-controller 8 (VTS) */
>>  static const struct samsung_pin_bank_data exynos9810_pin_banks8[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x000, "gpt0", 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x000, "gpt0", 0x00, 0x00),
>>  };
>>
>>  static const struct samsung_pin_ctrl exynos9810_pin_ctrl[] __initconst = {
>> @@ -1238,55 +1238,55 @@ const struct samsung_pinctrl_of_match_data exynos9810_of_data __initconst = {
>>
>>  /* pin banks of exynosautov9 pin-controller 0 (ALIVE) */
>>  static const struct samsung_pin_bank_data exynosautov9_pin_banks0[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x000, "gpa0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x020, "gpa1", 0x04),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 8, 0x000, "gpa0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos9_bank_type_alive, 2, 0x020, "gpa1", 0x04, 0x08),
>>         EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, 2, 0x040, "gpq0"),
>>  };
>>
>>  /* pin banks of exynosautov9 pin-controller 1 (AUD) */
>>  static const struct samsung_pin_bank_data exynosautov9_pin_banks1[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpb1", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpb2", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpb3", 0x0C),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x000, "gpb0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpb1", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpb2", 0x08, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpb3", 0x0C, 0x18),
>>  };
>>
>>  /* pin banks of exynosautov9 pin-controller 2 (FSYS0) */
>>  static const struct samsung_pin_bank_data exynosautov9_pin_banks2[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x000, "gpf0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpf1", 0x04),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x000, "gpf0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x020, "gpf1", 0x04, 0x08),
>>  };
>>
>>  /* pin banks of exynosautov9 pin-controller 3 (FSYS1) */
>>  static const struct samsung_pin_bank_data exynosautov9_pin_banks3[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x000, "gpf8", 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x000, "gpf8", 0x00, 0x00),
>>  };
>>
>>  /* pin banks of exynosautov9 pin-controller 4 (FSYS2) */
>>  static const struct samsung_pin_bank_data exynosautov9_pin_banks4[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf2", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpf3", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x040, "gpf4", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpf5", 0x0C),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x080, "gpf6", 0x10),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpf2", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpf3", 0x04, 0x04),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x040, "gpf4", 0x08, 0x0c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpf5", 0x0C, 0x14),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x080, "gpf6", 0x10, 0x1c),
>>  };
>>
>>  /* pin banks of exynosautov9 pin-controller 5 (PERIC0) */
>>  static const struct samsung_pin_bank_data exynosautov9_pin_banks5[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp1", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp2", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x060, "gpg0", 0x0C),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp1", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp2", 0x08, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x060, "gpg0", 0x0C, 0x18),
>>  };
>>
>>  /* pin banks of exynosautov9 pin-controller 6 (PERIC1) */
>>  static const struct samsung_pin_bank_data exynosautov9_pin_banks6[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp3", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp4", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp5", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpg1", 0x0C),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpg2", 0x10),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0A0, "gpg3", 0x14),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x000, "gpp3", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x020, "gpp4", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpp5", 0x08, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpg1", 0x0C, 0x18),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpg2", 0x10, 0x20),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0A0, "gpg3", 0x14, 0x28),
>>  };
>>
>>  static const struct samsung_pin_ctrl exynosautov9_pin_ctrl[] __initconst = {
>> @@ -1487,16 +1487,16 @@ const struct samsung_pinctrl_of_match_data exynosautov920_of_data __initconst =
>>  /* pin banks of exynos8890 pin-controller 0 (ALIVE) */
>>  static const struct samsung_pin_bank_data exynos8890_pin_banks0[] __initconst = {
>>         /* Must start with EINTG banks, ordered by EINT group number. */
>> -       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x000, "gpa0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x020, "gpa1", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x040, "gpa2", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x060, "gpa3", 0x0c),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x000, "gpa0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x020, "gpa1", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x040, "gpa2", 0x08, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTW(exynos7870_bank_type_alive, 8, 0x060, "gpa3", 0x0c, 0x18),
>>  };
>>
>>  /* pin banks of exynos8890 pin-controller 1 (AUD) */
>>  static const struct samsung_pin_bank_data exynos8890_pin_banks1[] __initconst = {
>>         /* Must start with EINTG banks, ordered by EINT group number. */
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x000, "gph0", 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x000, "gph0", 0x00, 0x00),
>>  };
>>
>>  /* pin banks of exynos8890 pin-controller 2 (CCORE) */
>> @@ -1508,73 +1508,73 @@ static const struct samsung_pin_bank_data exynos8890_pin_banks2[] __initconst =
>>  /* pin banks of exynos8890 pin-controller 3 (ESE) */
>>  static const struct samsung_pin_bank_data exynos8890_pin_banks3[] __initconst = {
>>         /* Must start with EINTG banks, ordered by EINT group number. */
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x000, "gpf3", 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x000, "gpf3", 0x00, 0x00),
>>  };
>>
>>  /* pin banks of exynos8890 pin-controller 4 (FP) */
>>  static const struct samsung_pin_bank_data exynos8890_pin_banks4[] __initconst = {
>>         /* Must start with EINTG banks, ordered by EINT group number. */
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpf2", 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x000, "gpf2", 0x00, 0x00),
>>  };
>>
>>  /* pin banks of exynos8890 pin-controller 5 (FSYS0) */
>>  static const struct samsung_pin_bank_data exynos8890_pin_banks5[] __initconst = {
>>         /* Must start with EINTG banks, ordered by EINT group number. */
>> -       EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 4, 0x000, "gpi1", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 8, 0x020, "gpi2", 0x04),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 4, 0x000, "gpi1", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos5433_bank_type_off, 8, 0x020, "gpi2", 0x04, 0x04),
>>  };
>>
>>  /* pin banks of exynos8890 pin-controller 6 (FSYS1) */
>>  static const struct samsung_pin_bank_data exynos8890_pin_banks6[] __initconst = {
>>         /* Must start with EINTG banks, ordered by EINT group number. */
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x000, "gpj0", 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 7, 0x000, "gpj0", 0x00, 0x00),
>>  };
>>
>>  /* pin banks of exynos8890 pin-controller 7 (NFC) */
>>  static const struct samsung_pin_bank_data exynos8890_pin_banks7[] __initconst = {
>>         /* Must start with EINTG banks, ordered by EINT group number. */
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpf0", 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpf0", 0x00, 0x00),
>>  };
>>
>>  /* pin banks of exynos8890 pin-controller 8 (PERIC0) */
>>  static const struct samsung_pin_bank_data exynos8890_pin_banks8[] __initconst = {
>>         /* Must start with EINTG banks, ordered by EINT group number. */
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x000, "gpi0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpd0", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x040, "gpd1", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpd2", 0x0c),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x080, "gpd3", 0x10),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0A0, "gpb1", 0x14),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0C0, "gpb2", 0x18),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x0E0, "gpb0", 0x1c),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x100, "gpc0", 0x20),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x120, "gpc1", 0x24),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x140, "gpc2", 0x28),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x160, "gpc3", 0x2c),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x180, "gpk0", 0x30),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x000, "gpi0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpd0", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x040, "gpd1", 0x08, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x060, "gpd2", 0x0c, 0x18),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x080, "gpd3", 0x10, 0x1c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0A0, "gpb1", 0x14, 0x20),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x0C0, "gpb2", 0x18, 0x24),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x0E0, "gpb0", 0x1c, 0x28),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x100, "gpc0", 0x20, 0x2c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 5, 0x120, "gpc1", 0x24, 0x34),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 6, 0x140, "gpc2", 0x28, 0x3c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x160, "gpc3", 0x2c, 0x44),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x180, "gpk0", 0x30, 0x4c),
>>         EXYNOS9_PIN_BANK_EINTN(exynos8895_bank_type_off, 7, 0x1A0, "etc1"),
>>  };
>>
>>  /* pin banks of exynos8890 pin-controller 9 (PERIC1) */
>>  static const struct samsung_pin_bank_data exynos8890_pin_banks9[] __initconst = {
>>         /* Must start with EINTG banks, ordered by EINT group number. */
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x000, "gpe0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpe5", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x040, "gpe6", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x060, "gpj1", 0x0c),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x080, "gpj2", 0x10),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0A0, "gpe2", 0x14),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0C0, "gpe3", 0x18),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0E0, "gpe4", 0x1c),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x100, "gpe1", 0x20),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x120, "gpe7", 0x24),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x140, "gpg0", 0x28),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x000, "gpe0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpe5", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x040, "gpe6", 0x08, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x060, "gpj1", 0x0c, 0x18),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 2, 0x080, "gpj2", 0x10, 0x20),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0A0, "gpe2", 0x14, 0x24),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0C0, "gpe3", 0x18, 0x2c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x0E0, "gpe4", 0x1c, 0x34),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x100, "gpe1", 0x20, 0x3c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 4, 0x120, "gpe7", 0x24, 0x44),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x140, "gpg0", 0x28, 0x48),
>>  };
>>
>>  /* pin banks of exynos8890 pin-controller 10 (TOUCH) */
>>  static const struct samsung_pin_bank_data exynos8890_pin_banks10[] __initconst = {
>>         /* Must start with EINTG banks, ordered by EINT group number. */
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpf1", 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpf1", 0x00, 0x00),
>>  };
>>
>>  static const struct samsung_pin_ctrl exynos8890_pin_ctrl[] __initconst = {
>> @@ -1643,69 +1643,69 @@ const struct samsung_pinctrl_of_match_data exynos8890_of_data __initconst = {
>>
>>  /* pin banks of exynos8895 pin-controller 0 (ALIVE) */
>>  static const struct samsung_pin_bank_data exynos8895_pin_banks0[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x020, "gpa0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x040, "gpa1", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x060, "gpa2", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x080, "gpa3", 0x0c),
>> +       EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x020, "gpa0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x040, "gpa1", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x060, "gpa2", 0x08, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTW(bank_type_alive, 8, 0x080, "gpa3", 0x0c, 0x18),
>>         EXYNOS9_PIN_BANK_EINTN(bank_type_alive, 7, 0x0a0, "gpa4"),
>>  };
>>
>>  /* pin banks of exynos8895 pin-controller 1 (ABOX) */
>>  static const struct samsung_pin_bank_data exynos8895_pin_banks1[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x000, "gph0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 7, 0x020, "gph1", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x040, "gph3", 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x000, "gph0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 7, 0x020, "gph1", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x040, "gph3", 0x08, 0x10),
>>  };
>>
>>  /* pin banks of exynos8895 pin-controller 2 (VTS) */
>>  static const struct samsung_pin_bank_data exynos8895_pin_banks2[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 3, 0x000, "gph2", 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 3, 0x000, "gph2", 0x00, 0x00),
>>  };
>>
>>  /* pin banks of exynos8895 pin-controller 3 (FSYS0) */
>>  static const struct samsung_pin_bank_data exynos8895_pin_banks3[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpi0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpi1", 0x04),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 3, 0x000, "gpi0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos8895_bank_type_off, 8, 0x020, "gpi1", 0x04, 0x04),
>>  };
>>
>>  /* pin banks of exynos8895 pin-controller 4 (FSYS1) */
>>  static const struct samsung_pin_bank_data exynos8895_pin_banks4[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x000, "gpj1", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 7, 0x020, "gpj0", 0x04),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x000, "gpj1", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 7, 0x020, "gpj0", 0x04, 0x08),
>>  };
>>
>>  /* pin banks of exynos8895 pin-controller 5 (BUSC) */
>>  static const struct samsung_pin_bank_data exynos8895_pin_banks5[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 2, 0x000, "gpb2", 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 2, 0x000, "gpb2", 0x00, 0x00),
>>  };
>>
>>  /* pin banks of exynos8895 pin-controller 6 (PERIC0) */
>>  static const struct samsung_pin_bank_data exynos8895_pin_banks6[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x000, "gpd0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x020, "gpd1", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x040, "gpd2", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x060, "gpd3", 0x0C),
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x080, "gpb1", 0x10),
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0a0, "gpe7", 0x14),
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0c0, "gpf1", 0x18),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x000, "gpd0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x020, "gpd1", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x040, "gpd2", 0x08, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x060, "gpd3", 0x0C, 0x14),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x080, "gpb1", 0x10, 0x1c),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0a0, "gpe7", 0x14, 0x20),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0c0, "gpf1", 0x18, 0x28),
>>  };
>>
>>  /* pin banks of exynos8895 pin-controller 7 (PERIC1) */
>>  static const struct samsung_pin_bank_data exynos8895_pin_banks7[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 3, 0x000, "gpb0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x020, "gpc0", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x040, "gpc1", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x060, "gpc2", 0x0C),
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x080, "gpc3", 0x10),
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x0a0, "gpk0", 0x14),
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0c0, "gpe5", 0x18),
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0e0, "gpe6", 0x1C),
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x100, "gpe2", 0x20),
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x120, "gpe3", 0x24),
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x140, "gpe4", 0x28),
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x160, "gpf0", 0x2C),
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x180, "gpe1", 0x30),
>> -       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 2, 0x1a0, "gpg0", 0x34),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 3, 0x000, "gpb0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x020, "gpc0", 0x04, 0x04),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 5, 0x040, "gpc1", 0x08, 0x0c),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x060, "gpc2", 0x0C, 0x14),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x080, "gpc3", 0x10, 0x1c),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x0a0, "gpk0", 0x14, 0x24),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0c0, "gpe5", 0x18, 0x28),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x0e0, "gpe6", 0x1C, 0x30),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x100, "gpe2", 0x20, 0x38),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x120, "gpe3", 0x24, 0x40),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x140, "gpe4", 0x28, 0x48),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 4, 0x160, "gpf0", 0x2C, 0x50),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 8, 0x180, "gpe1", 0x30, 0x54),
>> +       EXYNOS9_PIN_BANK_EINTG(bank_type_off, 2, 0x1a0, "gpg0", 0x34, 0x5c),
>>  };
>>
>>  static const struct samsung_pin_ctrl exynos8895_pin_ctrl[] __initconst = {
>> @@ -1776,36 +1776,36 @@ const struct samsung_pinctrl_of_match_data exynos8895_of_data __initconst = {
>>
>>  /* pin banks of FSD pin-controller 0 (FSYS) */
>>  static const struct samsung_pin_bank_data fsd_pin_banks0[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x00, "gpf0", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x20, "gpf1", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x40, "gpf6", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x60, "gpf4", 0x0c),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x80, "gpf5", 0x10),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x00, "gpf0", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x20, "gpf1", 0x04, 0x08),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 3, 0x40, "gpf6", 0x08, 0x10),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 2, 0x60, "gpf4", 0x0c, 0x14),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 6, 0x80, "gpf5", 0x10, 0x18),
>>  };
>>
>>  /* pin banks of FSD pin-controller 1 (PERIC) */
>>  static const struct samsung_pin_bank_data fsd_pin_banks1[] __initconst = {
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpc8", 0x00),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x020, "gpf2", 0x04),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpf3", 0x08),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpd0", 0x0c),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpb0", 0x10),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0a0, "gpb1", 0x14),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0c0, "gpb4", 0x18),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0e0, "gpb5", 0x1c),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x100, "gpb6", 0x20),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x120, "gpb7", 0x24),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x140, "gpd1", 0x28),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x160, "gpd2", 0x2c),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x180, "gpd3", 0x30),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1a0, "gpg0", 0x34),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1c0, "gpg1", 0x38),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1e0, "gpg2", 0x3c),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x200, "gpg3", 0x40),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x220, "gpg4", 0x44),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x240, "gpg5", 0x48),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x260, "gpg6", 0x4c),
>> -       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x280, "gpg7", 0x50),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x000, "gpc8", 0x00, 0x00),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x020, "gpf2", 0x04, 0x04),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x040, "gpf3", 0x08, 0x0c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x060, "gpd0", 0x0c, 0x14),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x080, "gpb0", 0x10, 0x1c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0a0, "gpb1", 0x14, 0x24),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x0c0, "gpb4", 0x18, 0x2c),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 4, 0x0e0, "gpb5", 0x1c, 0x34),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x100, "gpb6", 0x20, 0x38),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x120, "gpb7", 0x24, 0x40),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x140, "gpd1", 0x28, 0x48),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 5, 0x160, "gpd2", 0x2c, 0x50),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 7, 0x180, "gpd3", 0x30, 0x58),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1a0, "gpg0", 0x34, 0x60),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1c0, "gpg1", 0x38, 0x68),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x1e0, "gpg2", 0x3c, 0x70),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x200, "gpg3", 0x40, 0x78),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x220, "gpg4", 0x44, 0x80),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x240, "gpg5", 0x48, 0x88),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x260, "gpg6", 0x4c, 0x90),
>> +       EXYNOS9_PIN_BANK_EINTG(exynos9_bank_type_off, 8, 0x280, "gpg7", 0x50, 0x98),
>>  };
>>
>>  /* pin banks of FSD pin-controller 2 (PMU) */
>> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
>> index 536b01b4fd4a..c0f4639dbb0e 100644
>> --- a/drivers/pinctrl/samsung/pinctrl-exynos.h
>> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
>> @@ -141,24 +141,26 @@
>>                 .name           = id                            \
>>         }
>>
>> -#define EXYNOS9_PIN_BANK_EINTG(types, pins, reg, id, offs)     \
>> +#define EXYNOS9_PIN_BANK_EINTG(types, pins, reg, id, offs, fltcon_offs)        \
> 
> Here and further: please align all "\" characters to make a nice
> vertical bar. That simplifies reading the code.
> 
Ack.

>>         {                                                       \
>> -               .type           = &types,                       \
>> -               .pctl_offset    = reg,                          \
>> -               .nr_pins        = pins,                         \
>> -               .eint_type      = EINT_TYPE_GPIO,               \
>> -               .eint_offset    = offs,                         \
>> -               .name           = id                            \
>> +               .type                   = &types,               \
>> +               .pctl_offset            = reg,                  \
>> +               .nr_pins                = pins,                 \
>> +               .eint_type              = EINT_TYPE_GPIO,       \
>> +               .eint_offset            = offs,                 \
>> +               .eint_fltcon_offset     = fltcon_offs,          \
>> +               .name                   = id                    \
>>         }
>>
>> -#define EXYNOS9_PIN_BANK_EINTW(types, pins, reg, id, offs)     \
>> +#define EXYNOS9_PIN_BANK_EINTW(types, pins, reg, id, offs, fltcon_offs)        \
>>         {                                                       \
>> -               .type           = &types,                       \
>> -               .pctl_offset    = reg,                          \
>> -               .nr_pins        = pins,                         \
>> -               .eint_type      = EINT_TYPE_WKUP,               \
>> -               .eint_offset    = offs,                         \
>> -               .name           = id                            \
>> +               .type                   = &types,               \
>> +               .pctl_offset            = reg,                  \
>> +               .nr_pins                = pins,                 \
>> +               .eint_type              = EINT_TYPE_WKUP,       \
>> +               .eint_offset            = offs,                 \
>> +               .eint_fltcon_offset     = fltcon_offs,          \
>> +               .name                   = id                    \
>>         }
>>
>>  #define EXYNOSV920_PIN_BANK_EINTG(pins, reg, id, con_offs, mask_offs, pend_offs)       \
>> --
>> 2.39.2
>>
> 

