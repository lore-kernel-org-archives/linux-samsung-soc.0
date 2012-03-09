From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: SAMSUNG: Correct MIPI-CSIS io memory resource definition
Date: Fri, 09 Mar 2012 08:38:55 -0800
Message-ID: <4F5A321F.3020301@samsung.com>
References: <1329241007-28811-1-git-send-email-s.nawrocki@samsung.com> <056301ccec70$3d24b590$b76e20b0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:45686 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754557Ab2CIQi7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Mar 2012 11:38:59 -0500
Received: by yhmm54 with SMTP id m54so942261yhm.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Mar 2012 08:38:58 -0800 (PST)
In-Reply-To: <056301ccec70$3d24b590$b76e20b0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, linux-samsung-soc@vger.kernel.org, riverful.kim@samsung.com, sw0312.kim@samsung.com, 'Kyungmin Park' <kyungmin.park@samsung.com>

On 02/15/12 22:00, Kukjin Kim wrote:
> Sylwester Nawrocki wrote:
>>
>> The resources size is increased to 16KB to also include the non-image
>> packet
>> data buffers (CSIS_PKTDATAn). The 4KiB region is only sufficient when the
>> driver is not using the packet data buffers.
>>
>> Signed-off-by: Sylwester Nawrocki<s.nawrocki@samsung.com>
>> Signed-off-by: Kyungmin Park<kyungmin.park@samsung.com>
>>
>> ---
>> Hi Kgene,
>>
> Hi
>
>> This patch is a fix, but it should be needed starting from v3.4,
>> when the MIPI-CSIS driver is updated.
>>
> OK, will apply.
>
> But it's time to replace static definition for resource and as a note, I'm
> going to prepare it :)
>
> If any updates, let you know.
>
Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
