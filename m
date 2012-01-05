From: Amit Kachhap <amit.kachhap@linaro.org>
Subject: Re: [PATCH V4 0/5] ARM: exynos: Add l2 retention mode cpuidle state
Date: Thu, 5 Jan 2012 09:56:17 +0530
Message-ID: <CAK44p22NSBn+B_nhgq0TJXDa6x_QJHAo9xskBKOc3LTaHhMm6g@mail.gmail.com>
References: <1323083172-14096-1-git-send-email-amit.kachhap@linaro.org>
	<CADGdYn7ZU5xiDvOLMR4wVHEWtF-2p86jNZFCOXMV6PrZXuLWbQ@mail.gmail.com>
	<014a01ccca1a$b25495b0$16fdc110$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:42618 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757849Ab2AEE0S (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Jan 2012 23:26:18 -0500
Received: by qcqz2 with SMTP id z2so109137qcq.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Jan 2012 20:26:17 -0800 (PST)
In-Reply-To: <014a01ccca1a$b25495b0$16fdc110$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, patches@linaro.org, linaro-dev@lists.linaro.org

On 3 January 2012 18:52, Kukjin Kim <kgene.kim@samsung.com> wrote:
> amit kachhap wrote:
>>
>> Hi Mr kim,
>>
>> All the comments have been addressed for the Exynos cpu idle patchset.
>> The updated patchset was posted about one month back and there have
>> been no further comments on the patchset since then.
>>
>> As this patchset seems to be stable now, do you think these these
>> patches can merged in this 3.3 merge window? Kindly let me know your
>> opinion.
>>
>
> This conflicts with local common.[ch] working for ARM restart. Please wait
> until after the merge window for this patches.
>
Thanks for the update.
Actually I have fixed the merging issue in common.[ch] files so
sending the V5 series of the patchset shortly. If possible add in this
merge window or next merge window is also fine.

Regards,
Amit daniel
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
