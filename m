Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D093081B2
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 15:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759247182; cv=none; b=hSgoqFrggpMSqOKY6VWkqwD29sSVA0ldUV7JoXbFrc31UwM6yu/cvEVKNMKP0+o8HvzajSI2lVS5XG6/68bqgG6NhiAAGplTHhpomrFIRgD116aN1TdQaj7V8xhTzrfiVD5A/XXNyHiyL0WqaqOfYZHXUXD66xlK4soUcjKamLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759247182; c=relaxed/simple;
	bh=CAUFl+LYZAZIfEQ0dOPctsXAqjVr28NSuz7MjuxJt4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=FGqJ+080p6Bdl/oxmARgAo7eQRZBxsc1A22lRfzKo6s0REPKoKKfePqPJIlmvUpkEnTWJ/+1PlkLFxKwK06+oT//K/wIKAqA4lo0q92zMt4TbTtKwDArSLiFw8NCHJM29RDJKDQuAZNS6CyuUAArgsx9/iaEtZoREWuHq9dWozk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=GEmo2aaV; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="GEmo2aaV"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250930154613euoutp02582f8e08de0fb899c49ba015b438f06a~qGfujrOkK1925819258euoutp02c
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Sep 2025 15:46:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250930154613euoutp02582f8e08de0fb899c49ba015b438f06a~qGfujrOkK1925819258euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759247173;
	bh=iCpr5TzyOFeRuqU82QBgsAybOuX0sXWBwEO+eHNweII=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=GEmo2aaV3Fhb+h0H+OL88S5Un3zCHcz7kvEcOruc4TmXpXvHdpKjLwI7cEBp7asMO
	 muCNuGSqnMlJSRFBKwmUe+kxce/c8fhUiZy+mBT4fvst9i7T4SLjLU0Jge/xzV09V9
	 trHRBO20Um+o+53qS3gt/u6DVrintZBeymx0x8lo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250930154612eucas1p2cf5b43435487dc8e6b19b60d1a3801ef~qGft4sFWT2800928009eucas1p2c;
	Tue, 30 Sep 2025 15:46:12 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250930154610eusmtip1200c7ebad2fc47c80d082b3f7ac27ab7~qGfryC8yB2715127151eusmtip1T;
	Tue, 30 Sep 2025 15:46:09 +0000 (GMT)
Message-ID: <75d06769-4896-4095-9969-03a517705196@samsung.com>
Date: Tue, 30 Sep 2025 17:46:09 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_08/29=5D_media=3A_mfc=3A_Add_Exynos?=
 =?UTF-8?Q?=E2=80=91MFC_driver_probe_support?=
To: Krzysztof Kozlowski <krzk@kernel.org>, Himanshu Dewangan
	<h.dewangan@samsung.com>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
	alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com,
	ih0206.lee@samsung.com, jehyung.lee@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAJKOXPecLREbEDM4yfM=WD-EFfuBqPDXNZceATLeWQRj0X_w7w@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250930154612eucas1p2cf5b43435487dc8e6b19b60d1a3801ef
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250930035551epcas5p4ee7cb5af08eadb2f5ed6e5eaa06a60a9
X-EPHeader: CA
X-CMS-RootMailID: 20250930035551epcas5p4ee7cb5af08eadb2f5ed6e5eaa06a60a9
References: <CGME20250930035551epcas5p4ee7cb5af08eadb2f5ed6e5eaa06a60a9@epcas5p4.samsung.com>
	<20250930040348.3702923-1-h.dewangan@samsung.com>
	<20250930040348.3702923-9-h.dewangan@samsung.com>
	<CAJKOXPecLREbEDM4yfM=WD-EFfuBqPDXNZceATLeWQRj0X_w7w@mail.gmail.com>

Hi Krzysztof,

On 30.09.2025 07:54, Krzysztof Kozlowski wrote:
> On Tue, 30 Sept 2025 at 12:56, Himanshu Dewangan <h.dewangan@samsung.com> wrote:
>> From: Nagaraju Siddineni <nagaraju.s@samsung.com>
>>
>> Introduce a new Kconfig entry VIDEO_EXYNOS_MFC for the Samsung
>> Exynos MFC driver that supports firmware version 13 and later.
>> Extend the top‑level Samsung platform Kconfig to disable the legacy
>> S5P‑MFC driver when its firmware version is > v12 and to select the
>> new Exynos‑MFC driver only when VIDEO_SAMSUNG_S5P_MFC is not enabled.
>>
>> Add exynos-mfc Kconfig and Makefile for probe functionality and creation
>> of decoder and encoder device files by registering the driver object
>> exynos_mfc.o and other relevant source files.
>>
>> Provide header files mfc_core_ops.h and mfc_rm.h containing core
>>    operation prototypes, resource‑manager helpers,
>>    and core‑selection utilities.
>>
>> Add a configurable option MFC_USE_COREDUMP to enable core‑dump
>> support for debugging MFC errors.
>>
>> These changes bring support for newer Exynos‑based MFC hardware,
>> cleanly separate it from the legacy S5P‑MFC driver, and lay the
>> groundwork for future feature development and debugging.
>>
> No, NAK. Existing driver is well tested and already used on newest
> Exynos SoC, so all this new driver is exactly how you should not work
> in upstream. You need to integrate into existing driver.
>
> Samsung received this review multiple times already.

Please don't be so categorical. The MFC hardware evolved quite a bit 
from the ancient times of S5PV210 SoC, when s5p-mfc driver was designed. 
The feature list of the new hardware hardly matches those and I really 
don't see the reason for forcing support for so different hardware in a 
single driver. Sometimes it is easier just to have 2 separate drivers if 
the common part is just the acronym in the hardware block name...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

