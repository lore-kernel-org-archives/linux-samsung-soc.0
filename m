Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB18041F7C8
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jul 2026 11:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783338243; cv=none; b=Vsq0Ri8lEvX03eIV6RWgGda8RrQBdJqHBGBAso8e8nr39Hwr+aigYSfzqaTh9RV6z7KRfAHNpfcIln5r127YBwfJWsoX8no1DmdyJNlfUEcfVRTTOqffYcmLXCFjd5DrCDuCNl2AbfjsuNoPGLhCi+x931/k4zEAGUw3XncN/1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783338243; c=relaxed/simple;
	bh=vqTV/NN3IIxZnPyrUEekxqa2b4u7f0NhXCm5RYz4yJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=BfHkKWVzUOhkeIzwl3Rs5XjxR8Qr0Wvx+Xg3cP9IL53OrCFa/KkMSkrXk3mwR8968eQj8R9BuzigKkOzwynVkRA5EgzPU03RgcL6SYuBrxi2LDLdFeTEL5j07RJ3VdwnF+sk0k8CfnYpwxgwNDR2cOR8T3k9Rj+veGrcSqPLdCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dJXtj9vs; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dJXtj9vs"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260706114353euoutp01f56dce359f77cb1519ad6da3bb47e3a5~-sKzB85dN3194831948euoutp015
	for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jul 2026 11:43:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260706114353euoutp01f56dce359f77cb1519ad6da3bb47e3a5~-sKzB85dN3194831948euoutp015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783338233;
	bh=nqr1opbDhH9F0LAMNJ4a9CWrw1f0QTtgW31VtzekU9A=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=dJXtj9vsYk2TkIfkX+cUJCMSrOiQrABnWhAqVubgIPjkuM8hKHf6/AdaOzeyEH0I0
	 2ATZR/Fiij+otlKsiC3eUx+eh6EcIFAXEa/6sU52SL+tSa+3skadSFdijgZW324rI8
	 oYD/ZriViT2tzAhCFHtKQkxNMk7g36VRNPKK6T7k=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260706114353eucas1p1df24b3124b60f43d0ef2b99dab3ce8f7~-sKyr3B6O0115801158eucas1p1t;
	Mon,  6 Jul 2026 11:43:53 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260706114351eusmtip2c2f689f473e8a5f17c34b702e1a8b533~-sKw4uC6q2896828968eusmtip2B;
	Mon,  6 Jul 2026 11:43:51 +0000 (GMT)
Message-ID: <943cb5c6-d535-43cd-b1bf-ef23c46a8ec8@samsung.com>
Date: Mon, 6 Jul 2026 13:43:50 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH RESEND v4 0/3] drm/bridge: sii9234: use extcon to detect
 cable attachment
To: Henrik Grimler <henrik@grimler.se>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
	Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260630124301.GA4736@localhost>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260706114353eucas1p1df24b3124b60f43d0ef2b99dab3ce8f7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260630124317eucas1p274403ed88e4c0e567611cc397817b8b9
X-EPHeader: CA
X-CMS-RootMailID: 20260630124317eucas1p274403ed88e4c0e567611cc397817b8b9
References: <20260602-exynos4-sii9234-driver-v4-0-9b2fc38e104a@grimler.se>
	<CGME20260630124317eucas1p274403ed88e4c0e567611cc397817b8b9@eucas1p2.samsung.com>
	<20260630124301.GA4736@localhost>

+CC: Luca

On 30.06.2026 14:43, Henrik Grimler wrote:
> Hello,
>
> Friendly ping! This series has been reviewed/tested and still applies
> cleanly on drm-misc-next, could it be merged?
>
> Best regards,
> Henrik Grimler
>
> On Tue, Jun 02, 2026 at 08:36:47PM +0200, Henrik Grimler wrote:
>> Hi,
>>
>> This series fixes so HDMI through the sii9234 MHL chip works when
>> cable is hotplugged, by making the MHL chip use extcon cable detection
>> functions. Patch 3, that actually implements the extcon parts, is heavily
>> inspired by commit 688838442147 ("drm/bridge/sii8620: use micro-USB
>> cable detection logic to detect MHL") by Maciej Purski.
>>
>> Before these changes, HDMI only worked if cable was plugged in before
>> booting. If no cable was connected, then wlr-randr still showed HDMI
>> as connected, with 0x0 px, which confused at least some UIs (phosh)
>> and caused problems:
>> https://gitlab.gnome.org/World/Phosh/phosh/-/issues/828
>>
>> Tested on exynos4412-i9305.
>>
>> Best regards,
>> Henrik Grimler
>>
>> Signed-off-by: Henrik Grimler <henrik@grimler.se>
>> ---
>> Changes in v4:
>> - Collect tags
>> - Link to v3: https://lore.kernel.org/r/20250824-exynos4-sii9234-driver-v3-0-80849e716a37@grimler.se
>>
>> Changes in v3:
>> - Fix return of dev_err_probe in patch 2 and patch 3, spotted by
>>   Dmitry and Marek respectively.
>> - Change to depends on EXTCON || !EXTCON instead of select
>> - Collect tags for patch 1 (not 3 since there were (minor) changes)
>> - Link to v2: https://lore.kernel.org/r/20250724-exynos4-sii9234-driver-v2-0-faee244f1d40@grimler.se
>>
>> Changes in v2:
>> - Add dependency on extcon in patch 3. Issue reported by kernel test robot <lkp@intel.com>
>> - Link to v1: https://lore.kernel.org/r/20250721-exynos4-sii9234-driver-v1-0-2e47ed02f677@grimler.se
>>
>> ---
>> Henrik Grimler (3):
>>       drm/bridge: sii9234: fix some typos in comments and messages
>>       drm/bridge: sii9234: use dev_err_probe where applicable
>>       drm/bridge: sii9234: use extcon cable detection logic to detect MHL
>>
>>  drivers/gpu/drm/bridge/Kconfig   |   1 +
>>  drivers/gpu/drm/bridge/sii9234.c | 124 +++++++++++++++++++++++++++++++--------
>>  2 files changed, 102 insertions(+), 23 deletions(-)
>> ---
>> base-commit: a87fef0880c4f52769b5a3c2fc1b2d73aaa04eb3
>> change-id: 20231218-exynos4-sii9234-driver-d817d4b511d5
>>
>> Best regards,
>> -- 
>> Henrik Grimler <henrik@grimler.se>
>>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

