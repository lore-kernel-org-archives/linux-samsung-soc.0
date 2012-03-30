From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: S3C24XX: fix missing common.h in mach-s3c24xx/
Date: Fri, 30 Mar 2012 15:58:39 -0700
Message-ID: <4F763A9F.2010907@samsung.com>
References: <1332980074-4614-1-git-send-email-kgene.kim@samsung.com> <4F74556F.10704@mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:41635 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934950Ab2C3W6q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Mar 2012 18:58:46 -0400
Received: by dake40 with SMTP id e40so44510dak.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Mar 2012 15:58:45 -0700 (PDT)
In-Reply-To: <4F74556F.10704@mvista.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sergei Shtylyov <sshtylyov@mvista.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Sergei Shtylyov wrote:
> Hello.
>
> On 29-03-2012 4:14, Kukjin Kim wrote:
>

[...]

>> +#ifdef CONFIG_CPU_S3C2410
>> +void s3c2410_restart(char mode, const char *cmd);
>> +#endif
>> +
>> +#ifdef CONFIG_CPU_S3C244X
>> +void s3c244x_restart(char mode, const char *cmd);
>> +#endif
>
> Those #ifdef's around function prototypes are not necessary.
>
OK, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
