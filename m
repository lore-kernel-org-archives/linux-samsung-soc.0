Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BE223741
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 07:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763106279; cv=none; b=rTjKBnwskDtDOYEF4gmUSHmZ3Y3z8mSGpu3GrMgbwwHXAf8ONSgpAZL4VEgW1AWYnR7cXY3d4W0h5AllYdvmvjkgStOoC/Md9uZMflxCuwhqnT2kGAhi/LLBHr6oJzJZIkRNtlGDEle2bejZU1lZZBtD6GarqjjAr17xIYg6crc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763106279; c=relaxed/simple;
	bh=OoDGJmuXFwSKdjIer95zaywJQYOc7uRGsuA59n8RaNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=eqlmirQGZbrCAIyMaxA42hcOvYZZYHW72wLD/uDa7wQ+5fHbrjOuG9w+ePXlMxTHP0NosifM5xdRD5V5ZuJH+vyOJV2BnLOMZTigrMzJ98x8MJdgOnHrdAhxCF+lLwzE805EO/SJ27/7N9tRVAn+ltIlNI1Q66D3t4Gyxl74z2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=WqS5q3et; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="WqS5q3et"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251114074435epoutp04ca59bdf9a0af084bc6496a5a2c5d3073~3z9DW0J7X1189911899epoutp04z
	for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Nov 2025 07:44:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251114074435epoutp04ca59bdf9a0af084bc6496a5a2c5d3073~3z9DW0J7X1189911899epoutp04z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763106275;
	bh=i/YAdCwZ2utDOR2M9zCAO/cmVzO7eEbvAvCLlAy+QYg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=WqS5q3etxjpfMOntFITTWQGtV5vksMRSSKYPJZgIWnd3X0LdBwoM2LZwAV2wtVH9x
	 vZkbEp9ADJy9kXVtKMpjexjHApwGpB1zAOF5rS//cE7b/Sss22vMtY6ASoxVfDSdHx
	 Kx5pW9DlZNIh3vXg+lfquKgNP9T6PD1DW7McDhuI=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20251114074434epcas2p489a8f183b316304a4413551e4e84d059~3z9C_sNdm2239922399epcas2p4Y;
	Fri, 14 Nov 2025 07:44:34 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.38.209]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4d78Kt1tRMz2SSKk; Fri, 14 Nov
	2025 07:44:34 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20251114074433epcas2p3070e82e1dc5f76a53156c051cf07f45d~3z9CFeJ692674426744epcas2p39;
	Fri, 14 Nov 2025 07:44:33 +0000 (GMT)
Received: from [12.36.160.98] (unknown [12.36.160.98]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251114074433epsmtip195fad0fbaaa584d93cfad1550eee9f7c~3z9CAZA1V3140331403epsmtip1V;
	Fri, 14 Nov 2025 07:44:33 +0000 (GMT)
Message-ID: <815f7c12-a47f-4838-bca8-63cd080b54cc@samsung.com>
Date: Fri, 14 Nov 2025 16:45:48 +0900
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH v1 0/5] pinctrl: samsung: exynos9 cleanups and fixes
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, alim.akhtar@samsung.com,
	linus.walleij@linaro.org, peter.griffin@linaro.org, ryu.real@samsung.com,
	d7271.choe@samsung.com, linux-samsung-soc@vger.kernel.org
Content-Language: en-US
From: Youngmin Nam <youngmin.nam@samsung.com>
In-Reply-To: <CAPLW+4mo0n3C=_akxH=PKvdaQFn1pSCK-DhPsm8aWkvSuvJgTQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251114074433epcas2p3070e82e1dc5f76a53156c051cf07f45d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251110082128epcas2p410405ffa61706c79f0bc2abe56393ba7
References: <CGME20251110082128epcas2p410405ffa61706c79f0bc2abe56393ba7@epcas2p4.samsung.com>
	<20251110082649.3109858-1-youngmin.nam@samsung.com>
	<CAPLW+4mo0n3C=_akxH=PKvdaQFn1pSCK-DhPsm8aWkvSuvJgTQ@mail.gmail.com>

On 11/13/25 08:06, Sam Protsenko wrote:
> Hi Youngmin,
> 
> On Mon, Nov 10, 2025 at 2:21 AM Youngmin Nam <youngmin.nam@samsung.com> wrote:
>>
>> This series tidies Exynos9-style pinctrl.
>> Unify macros, fix a few TRM mismatches, and clarify naming.
>>
>> Several SoCs carried near-duplicate pin bank macro families, making tables
>> verbose and hard to share when only the bank type (alive/off) differs.
>>
>> GS101 had its own helpers even though the newer EXYNOS9_* helpers cover the
>> same semantics, including per-bank filter control (FLTCON) offsets.
>>
>> Some pin-bank tables didn’t match the SoC TRMs (bank type, EINT class, or
>> bank names), and FLTCON wasn’t always at a contiguous offset from EINT.
>>
>> This series does
>> - Consolidate on EXYNOS9_* pin-bank macros. Pass bank_type explicitly.
>> - Fix table errors on Exynos2200/7885/8890/8895 per TRM.
>> - Add explicit per-bank FLTCON offsets and update affected tables.
>> - Drop GS101-specific macros in favor of EXYNOS9_*.
>> - Rename gs101_pinctrl_{suspend,resume} -> exynos9_pinctrl_{suspend,resume}.
>>
> 
> Thank you for looking into this! I think this unification is very much
> needed. It reduces code duplication, and as I understand reflects
> correctly the fact that all modern ARM64 Exynos chips currently
> supported in Linux share pretty much the same GPIO/pinctrl IP-core,
> with a similar registers layout.
> 
>> I tested on Exynos850 through boot and verified the pin values as follows:
>>
>> $:/sys/kernel/debug/pinctrl/139b0000.pinctrl-samsung-pinctrl# cat pins
>> registered pins: 42
>> pin 0 (gpg0-0) 0:gpg0  CON(0x0) DAT(0x0) PUD(0x1) DRV(0x2) CON_PDN(0x2) PUD_PDN(0x1)
>> pin 1 (gpg0-1) 1:gpg0  CON(0x0) DAT(0x0) PUD(0x1) DRV(0x2) CON_PDN(0x2) PUD_PDN(0x1)
>> ...
>>
> 
> Yes, I verified it on the E850-96 board too. Checked the pin muxes and
> GPIO lines, everything works fine with your series applied. Feel free
> to add, for the whole series:
> 
> Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
> 
> I'll try to also review all the patches in the series shortly.
> 
>> Additional testing on the affected Exynos9-era platforms would be appreciated.
>>
> 
> I'd add that this series was based on the pinctrl/samsung tree [1], to
> make it easier for people to apply and test this series.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git
> 

Hi Sam,

Thank you for the positive feedback on the series, and for the review and testing.
I’ll incorporate your comments and send a v2.


>> Youngmin Nam (5):
>>   pinctrl: samsung: Consolidate pin-bank macros under EXYNOS9_* and pass
>>     bank_type explicitly
>>   pinctrl: samsung: fix incorrect pin-bank entries on
>>     Exynos2200/7885/8890/8895
>>   pinctrl: samsung: add per-bank FLTCON offset to EXYNOS9_PIN_BANK_* and
>>     fix tables
>>   pinctrl: samsung: exynos: fold GS101 pin-bank macros into EXYNOS9_*
>>   pinctrl: samsung: rename gs101_pinctrl_* to exynos9_pinctrl_*
>>
>>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 1069 ++++++++---------
>>  drivers/pinctrl/samsung/pinctrl-exynos.c      |    4 +-
>>  drivers/pinctrl/samsung/pinctrl-exynos.h      |   93 +-
>>  drivers/pinctrl/samsung/pinctrl-samsung.h     |    4 +-
>>  4 files changed, 560 insertions(+), 610 deletions(-)
>>
>> --
>> 2.39.2
>>
> 

