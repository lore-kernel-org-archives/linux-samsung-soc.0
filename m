Received: from mail-m21473.qiye.163.com (mail-m21473.qiye.163.com [117.135.214.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D324427462;
	Wed, 17 Dec 2025 03:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.214.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765942142; cv=none; b=j6C9S748hqaL+OOj9Ov/HM45ErkTchziYMeIDiDSQa4He91K0qor6MZBDIIFgQ2VpbGgNvSj+A9rCSiHPYfJbZwjt/ziqBBRiyyZHaO0VyA503tgP1e3v9YfbV7GcUV9qJ7JXNdE5WSlPp2Nu9iysewoNHCo/zkglY4zyfRfcd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765942142; c=relaxed/simple;
	bh=F+Hqvi/3zbb2gFqymRHobHY3XvRA27ryve2YkXl3g9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BvfdOnI45l2KrT3kJSqXpc8yjClkzldHaD9oIK1N/uZyH2F4kmSFwp57vj86aC3yqj1XUi+G6BQroJKEhds/4gHBzznZADaldje4rw+TjlKX8ydCSt6TVDGApqO+cFgJizn/B5yR/5+RIJCs1J/IEjwFsBdTtSj4qlV5AhjyW/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=ApUr7K7j; arc=none smtp.client-ip=117.135.214.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="ApUr7K7j"
Received: from [172.16.12.43] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2d82b3408;
	Wed, 17 Dec 2025 10:53:29 +0800 (GMT+08:00)
Message-ID: <49580dcf-28ec-47e1-83a0-65e16e3d7cdc@rock-chips.com>
Date: Wed, 17 Dec 2025 10:53:27 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/18] drm/display: bridge_connector: Ensure last
 bridge determines EDID/modes detection capabilities
To: Heiko Stuebner <heiko@sntech.de>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 jingoohan1@gmail.com, p.zabel@pengutronix.de, hjc@rock-chips.com,
 andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 dianders@chromium.org, m.szyprowski@samsung.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20251021023130.1523707-1-damon.ding@rock-chips.com>
 <DDNXIYL494D2.2N8L1J7XTBT4S@bootlin.com>
 <ff65f453-68a9-41fc-b9e3-02733bba96e3@rock-chips.com>
 <3351986.usQuhbGJ8B@phil>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <3351986.usQuhbGJ8B@phil>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b2a3a18bd03a3kunmcb0179dc4d924
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0pCT1ZPT0NLHkMZQ01IGkxWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=ApUr7K7j4T/yGlwwgAFrpOxVUqFD/a1yndvUn+XdRj6uUCvdFSb+qUOyjtg4AxNbCr3sfJ5FIcABvkAm3hUXM4VBCtxaeaMuzferaCWkxK+C8uF5Q6QTdk7/uHHjULqNPliiS7WICt3+vT3RMmm0GoRA4TxExa+pe8xL8JlwV0o=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=ORkOGU2sYY0sjXmEYnHmp1Vc7q0DwAfMuZhejaTUoas=;
	h=date:mime-version:subject:message-id:from;

Hi Heiko,

On 12/16/2025 9:48 PM, Heiko Stuebner wrote:
> Am Mittwoch, 22. Oktober 2025, 03:15:52 Mitteleuropäische Normalzeit schrieb Damon Ding:
>> Hi Luca,
>>
>> On 10/21/2025 6:31 PM, Luca Ceresoli wrote:
>>> Hello Damon,
>>>
>>> On Tue Oct 21, 2025 at 4:31 AM CEST, Damon Ding wrote:
> 
>>>
>>> This does not apply on current drm-misc-next, due to the patch I mentioned
>>> in a previous iteration, now applied as commit 2be300f9a0b6 ("drm/display:
>>> bridge_connector: get/put the stored bridges").
>>>
>>> However I'm sorry I have to mention that patch turned out being buggy, so
>>> I've sent a series to apply a corrected version [0]. I suggest watching the
>>> disucssion about the fix series, and if that gets approved rebase on top of
>>> that and adapt your changes.
>>>
>>> Sorry about the mess. :(
>>>
>>> [0] https://lore.kernel.org/r/20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com
>>>
>>>
>>
>> I saw your fix patches before sending this series. I think your patches
>> will likely be merged relatively quickly, so I plan to wait until the
>> other patches in my patch series are confirmed to be fine, then submit
>> v8 version based on the latest bridge_connector driver. :-)
> 
> I think with 6.19-rc1 out, now is a great time for v8? :-)
> 

Agreed! Luca's patches have been merged. I will reconfirm these commits 
on the latest branch and update v8 in a few day. :-)

Best regards,
Damon

