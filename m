From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 0/4] ARM: SAMSUNG: Add support CPU ID and Rev. at runtime
Date: Sat, 20 Aug 2011 15:34:32 +0900
Message-ID: <CAH9JG2VLzgdn_aD4eTsx8TpDAOvQHqcC8HCJtPvScbe+OBY+Pw@mail.gmail.com>
References: <1313816759-14564-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:42426 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751011Ab1HTGed convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 20 Aug 2011 02:34:33 -0400
Received: by qyk38 with SMTP id 38so590096qyk.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Aug 2011 23:34:33 -0700 (PDT)
In-Reply-To: <1313816759-14564-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Good

change the mind to use the runtime soc detection. it's really required
feature. but previous time Ben did'n like it.
https://lkml.org/lkml/2010/3/30/831

I'm still prefer to use it when only early boot time if possible

and another mail said cpu_is_* doesn't proper name, soc_is_* is better.


Thank you,
Kyungmin Park

On Sat, Aug 20, 2011 at 2:05 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> This patch adds support handling of CPU ID and varialble silicon revi=
sion
> at runtime.
>
> [PATCH 1/4] ARM: SAMSUNG: Add support for detecting CPU at runtime
> [PATCH 2/4] ARM: S5P64X0: Use cpu_is_s5p64x0() to distinguish cpu at =
runtime
> [PATCH 3/4] ARM: SAMSUNG: Add support for handling of cpu revision
> [PATCH 4/4] ARM: EXYNOS4: Use samsung_rev() to distinguish silicon re=
vision
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
