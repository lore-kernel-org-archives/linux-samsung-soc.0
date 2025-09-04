Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A80E277814
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Sep 2025 06:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756968054; cv=none; b=VEoAdTbXcatuGC5rZ0QHlvEp03oGny2rm3S3iD1hWi9odFFDGs7QkB3tFCMPt+Q/UULnG2JYaq8NBb8XqG6a0LD41IvhZKKxRiZkQ6opauIlzZtI2HzCsyn51X7UIOWZLknWF3VEbjHWGm5IJ70PeUZEOLxzuaHyp0OCTqiRKYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756968054; c=relaxed/simple;
	bh=rGwELpiIkEXKasOo4ZGjIOtJc4NrTEJzdYZs619kaC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=feIWulxnmjbuQxQE4OGtzI9I4s+93TITPR2cM74EWz8yuLzHSO+VDtvIRk8ZZbJAYWjMO/sOyXIgqYvuXEuamyr3JZ6kj6IaJHpMp+P3Yr6N8rvpjlpNv0x/L5iJ/BhdGsi26yZ6r63yHK0euEY8EuP+GqMArL7+rGTZ91EH0YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=QcCwCcTL; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="QcCwCcTL"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250904064044euoutp01402478ee6453125df7e2e5cceca47d2c~iASC2GQJP1666516665euoutp01J
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Sep 2025 06:40:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250904064044euoutp01402478ee6453125df7e2e5cceca47d2c~iASC2GQJP1666516665euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756968044;
	bh=A/yDGtDHqTHoPVxQFOAkkIfF4zIy3UZ0vUKDgsqqVOc=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=QcCwCcTLjQhAJBgjfcjHoBleYj4ltUDCEaUZJOMVDss/gKJSWYHjYpNOWQAVkJiVc
	 jwhEHY1qQfXL/ywyJ/C47pdoWEkGIt8ea2MbcgYn1yBHUsd5cOwEnItFQFZCfKh4FG
	 9jmQa351xLqb/mMwR47RWNj2RqqZzqnX9Mg0+8Bk=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250904064044eucas1p1903e2408a311a9a88aa7459c078f0ca3~iASCdUNGL3162431624eucas1p1k;
	Thu,  4 Sep 2025 06:40:44 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250904064042eusmtip130798f35ba17f7345464a545efd3511c~iASBRoIaA0826508265eusmtip1S;
	Thu,  4 Sep 2025 06:40:42 +0000 (GMT)
Message-ID: <532937cb-fa69-4010-b2cf-cba9a2e6c730@samsung.com>
Date: Thu, 4 Sep 2025 08:40:42 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v3 3/3] drm/bridge: sii9234: use extcon cable detection
 logic to detect MHL
To: Henrik Grimler <henrik@grimler.se>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
	Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	replicant@osuosl.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250903193231.GA5526@l14.localdomain>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250904064044eucas1p1903e2408a311a9a88aa7459c078f0ca3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250824111745eucas1p20e336aecd501200bdd035bfc30ce1e63
X-EPHeader: CA
X-CMS-RootMailID: 20250824111745eucas1p20e336aecd501200bdd035bfc30ce1e63
References: <20250824-exynos4-sii9234-driver-v3-0-80849e716a37@grimler.se>
	<CGME20250824111745eucas1p20e336aecd501200bdd035bfc30ce1e63@eucas1p2.samsung.com>
	<20250824-exynos4-sii9234-driver-v3-3-80849e716a37@grimler.se>
	<ac222017-d4e2-4fa7-beed-cc6b73042a73@samsung.com>
	<20250903193231.GA5526@l14.localdomain>

On 03.09.2025 21:32, Henrik Grimler wrote:
> On Mon, Aug 25, 2025 at 04:16:50PM +0200, Marek Szyprowski wrote:
>> On 24.08.2025 13:16, Henrik Grimler wrote:
>>> To use MHL we currently need the MHL chip to be permanently on, which
>>> consumes unnecessary power. Let's use extcon attached to MUIC to enable
>>> the MHL chip only if it detects an MHL cable.
>>>
>>> Signed-off-by: Henrik Grimler <henrik@grimler.se>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>
>> On Trats2 board the status of HDMI connector is no properly reported as
>> disconnected when no cable is attached.
> Thanks for testing (again)!
>
> In what way is it not properly reported as disconnected, are you
> checking some sysfs property, or with some userspace tool?

Huh, my typo. It should be 'connector is *now* properly reported', 
that's why I gave my 'tested-by' tag.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

