From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: EXYNOS: Adds Samsung TRATS board support
Date: Fri, 10 Feb 2012 17:01:27 +0900
Message-ID: <CAH9JG2VLxmsafu09RmU5GPXnQUMnJo8XZSQcKTkBD2ZpnZ6yPQ@mail.gmail.com>
References: <1324624169-16102-1-git-send-email-riverful.kim@samsung.com>
	<1327652483-15655-1-git-send-email-riverful.kim@samsung.com>
	<CAJuYYwRn7Luhj0223-i9u3ETutb8qgFUY7FEBq-ZOUi74DouMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:60520 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753546Ab2BJIB2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 03:01:28 -0500
Received: by qadc10 with SMTP id c10so128648qad.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Feb 2012 00:01:27 -0800 (PST)
In-Reply-To: <CAJuYYwRn7Luhj0223-i9u3ETutb8qgFUY7FEBq-ZOUi74DouMA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: "HeungJun, Kim" <riverful.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, Karol Lewandowski <k.lewandowsk@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

+ Karol for DT support later

On Fri, Feb 10, 2012 at 3:58 AM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:
> Dear Mr. HeungJun Kim,
>
> On 27 January 2012 00:21, HeungJun, Kim <riverful.kim@samsung.com> wr=
ote:
>> This patch adds Samsung Mobile TRATS board support.
>>
>> Signed-off-by: HeungJun, Kim <riverful.kim@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>> =A0arch/arm/mach-exynos/Kconfig =A0 =A0 =A0| =A0 11 ++
>> =A0arch/arm/mach-exynos/Makefile =A0 =A0 | =A0 =A01 +
>> =A0arch/arm/mach-exynos/mach-trats.c | =A0344 ++++++++++++++++++++++=
+++++++++++++++
>> =A03 files changed, 356 insertions(+), 0 deletions(-)
>> =A0create mode 100644 arch/arm/mach-exynos/mach-trats.c
>
> The exynos4 dt-enabled board file can support most of the features
> added in this board file. The other option that could be considered
> here would be to add DT support for this board file, and use AUX_DATA
> to supply platform data for drivers that do not have dt support yet.
> It would be better to use dt support for new board support that we
> add.
>
> Thanks,
> Thomas.
>
> (snip)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
