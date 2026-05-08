Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4219236E460
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 May 2026 15:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254097; cv=none; b=MdgUFVXe9LxWzNLI1406rY6edOtRzR/uSyjyADopkB085KUmksL/3mh4WfePHdLHKGKWE7yKH5RlzubjyRI+T4eufgKE0jq8p+z0YRaw7+Gsuo9hCC29ACg/zClQWqfJuzFYX6GeGRj1X/8fstN6wFvGJ9A+YAWgrQpO4YY8mX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254097; c=relaxed/simple;
	bh=GOhxaon6hQu133fWIklDfu0rzP5Nv5QskwgnXq3idb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=XOBiiV+UgCFS0msCvYfgRpkiJcEc7CIwNnHGiKrR1BU51kCjwzAteEjOVW03Xov/shY0YPHJ9xki+ZHifi1gMDktWQyLLKBxzAQAgUojRlDS3BJItTGjYAPhT6KG0dxnr5ufDmNMMi7QMNpK2hYYj0S+XbweuTTNpOkAHKTfpS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=T3tMdmDR; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="T3tMdmDR"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260508152811euoutp0196d7f1239f4400cec08ce49ede12a488~toKzLdSXj1170911709euoutp01K
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 May 2026 15:28:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260508152811euoutp0196d7f1239f4400cec08ce49ede12a488~toKzLdSXj1170911709euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1778254091;
	bh=zhLVaZoIYtKZD982Up3M46vJMIvHpaWwu2gUst5i/FQ=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=T3tMdmDRS6RhxoVsovoiQ1ghdV4J7cFsbQ/iccpH4etu0rgfvC+mFV25Qehe4DYGf
	 9A0ieO+E3fZ2z6YclXeHSIX44RbCwcJdXxsoVCMWO0nk2h0oDuGpsn+R/yZn+3lnX+
	 ZAox95kSKKc3MyOkO/fW4dFWOGYu4OTPcKgMq9fI=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260508152811eucas1p1fb4fe6e059084dea033db42bc5064f3d~toKy24ak50622506225eucas1p1E;
	Fri,  8 May 2026 15:28:11 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260508152810eusmtip1420f8db7ec741b20c48924b45539d1b3~toKyP8cvW0667106671eusmtip1Q;
	Fri,  8 May 2026 15:28:10 +0000 (GMT)
Message-ID: <55bdf688-85f5-4b2b-9e90-b4a2c671250f@samsung.com>
Date: Fri, 8 May 2026 17:28:10 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [BUG] exynos5_i2c_xfer_atomic() can sleep.
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Waiman
	Long <longman@redhat.com>, linux-rt-devel@lists.linux.dev, Andi Shyti
	<andi.shyti@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260508104235.n9gGOYqU@linutronix.de>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260508152811eucas1p1fb4fe6e059084dea033db42bc5064f3d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260506065541eucas1p2f986355d0a06ac1f72aa00e8d3148ad0
X-EPHeader: CA
X-CMS-RootMailID: 20260506065541eucas1p2f986355d0a06ac1f72aa00e8d3148ad0
References: <CGME20260506065541eucas1p2f986355d0a06ac1f72aa00e8d3148ad0@eucas1p2.samsung.com>
	<20260506065110.sY3jKS7G@linutronix.de>
	<03c06142-12eb-45b7-8d22-ce12fab6e132@samsung.com>
	<20260508100910.nxRkt3mA@linutronix.de>
	<dbacd56b-2914-40ce-9139-78b819a81c13@samsung.com>
	<20260508104235.n9gGOYqU@linutronix.de>

On 08.05.2026 12:42, Sebastian Andrzej Siewior wrote:
> On 2026-05-08 12:35:51 [+0200], Marek Szyprowski wrote:
>> Ah, it looks that I've checked irq_disable() code, so that's why I
>> didn't find might_sleep() call. In the case of exynos5_i2c driver,
>> probably switching to disable_irq_nosync() will be enough. I assume
>> that all previous transfers have to be finished to start this atomic
>> one, so waiting for interrupts to finish is not needed.
> This looks kind of odd. Are the "other" transfers really done at this
> point? Do you have a backtrace for me from the atomic path?

I thought that i2c core somehow serializes the transfers for the given master.

> Is this needed because you need to send the "power off" command via i2c?

Yes, most embedded boards do power off by sending i2c command to PMIC chip.


> Could you try to test with PREEMPT_RT? I'm sure how this works there.

I will check this, but so far I run all my tests without PREEMPT_RT

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

