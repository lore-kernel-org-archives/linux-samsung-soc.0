From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH v5 0/7] platform/chrome: Add user-space dev inferface
 support
Date: Fri, 27 Feb 2015 06:17:53 +0100
Message-ID: <54EFFE01.7080200@collabora.co.uk>
References: <1422876388-16540-1-git-send-email-javier.martinez@collabora.co.uk>	<CAMHSBOWy4NdPRjw2SXFmcCF2zKwx=i79RxgHR2CLnLxpamPswQ@mail.gmail.com> <CAOesGMgdpoQ3CEKFgDZxkiCLj1gRtBODGpJQGNtNGh4Pzz5TCA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:55709 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751732AbbB0FSM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Feb 2015 00:18:12 -0500
In-Reply-To: <CAOesGMgdpoQ3CEKFgDZxkiCLj1gRtBODGpJQGNtNGh4Pzz5TCA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Gwendal Grignou <gwendal@chromium.org>
Cc: Lee Jones <lee.jones@linaro.org>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Jonathan Corbet <corbet@lwn.net>, Varka Bhadram <varkabhadram@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Hello,

On 02/27/2015 01:11 AM, Olof Johansson wrote:
> On Thu, Feb 26, 2015 at 3:35 PM, Gwendal Grignou <gwendal@chromium.org> wrote:
>> Tested-by: Gwendal Grignou <gwendal@chromium.org>
>> Reviewed-by: Gwendal Grignou <gwendal@chromium.org>
>>
>> Tested on a chromebook pixel with kernel 4.0.0-rc1 and ectool using
>> the enclosed patch in chromiumos platform/ec tree.
>> I checked the lightbar is working, check the calls with "strace ectool
>> ...", check the sysfs interface calls.
> 
> 
> Thanks Gwendal.
>

Thanks a lot Gwendal for testing
 
> Series has been applied and pushed out to for-next now.
> 
> Thanks all. Bring on the next batch. Javier!
>

Thanks, Fengguang's build bot found a couple of issues
though so I'll post the fixes for those now.
 
> 
> -Olof
> 

Best regards,
Javier
