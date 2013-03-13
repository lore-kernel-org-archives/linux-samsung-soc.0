From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH v3] iio: adc: exynos5_adc: fix compilation warnings
Date: Wed, 13 Mar 2013 19:11:33 +0100
Message-ID: <5140C155.2070507@metafoo.de>
References: <1362625743-10401-1-git-send-email-ch.naveen@samsung.com> <1363150138-20819-1-git-send-email-ch.naveen@samsung.com> <CAD=FV=XoE6NCruDUv2UajaP+LWDCp+pgaZJsEKpkoxy3tZNeAw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp-out-064.synserver.de ([212.40.185.64]:1173 "EHLO
	smtp-out-057.synserver.de" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1756485Ab3CMSJo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Mar 2013 14:09:44 -0400
In-Reply-To: <CAD=FV=XoE6NCruDUv2UajaP+LWDCp+pgaZJsEKpkoxy3tZNeAw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, linux-iio <linux-iio@vger.kernel.org>, dan.carpenter@oracle.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Naveen Krishna <naveenkrishna.ch@gmail.com>

On 03/13/2013 07:01 PM, Doug Anderson wrote:
> Naveen,
> 
> On Tue, Mar 12, 2013 at 9:48 PM, Naveen Krishna Chatradhi
> <ch.naveen@samsung.com> wrote:
>> Doug, There was a comment from Lars regarding the match not
>> being NULL, if driver depends on CONFIG_OF. So, i've removed
>> the NULL check in v2 of this patch.
>>         https://patchwork.kernel.org/patch/2222841/
>>
>> I'm checking the return value of get_version() for -ve values before
>> assigning to info->version. So, i left the (unsigned int) unchanged.
> 
> Hmmm, I guess this was the point that confused me.  I went back and
> agree with Lars--it can't be NULL.  ...but that means that
> exynos_adc_get_version() can't return an error, so why are we checking
> for an error?

Agreed. Adding the dependency on OF in Kconfig should be all that is needed.

- Lars
