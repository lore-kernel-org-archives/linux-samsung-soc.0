From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RESEND PATCH 1/8] mfd: cros ec: Remove parent field
Date: Sat, 09 May 2015 03:38:08 +0200
Message-ID: <554D6500.4070106@collabora.co.uk>
References: <1428336906-14906-1-git-send-email-javier.martinez@collabora.co.uk> <1428336906-14906-2-git-send-email-javier.martinez@collabora.co.uk> <CAMHSBOV3PxRqeHtMsDvqOaCLX7QpJ-ncvrfES_oixWAG1ZkDQg@mail.gmail.com> <20150429103734.GU9169@x1> <5548882A.50400@collabora.co.uk> <20150505105439.GB4047@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:39904 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751568AbbEIBiQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 May 2015 21:38:16 -0400
In-Reply-To: <20150505105439.GB4047@x1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Gwendal Grignou <gwendal@chromium.org>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Bill Richardson <wfrichar@chromium.org>, Simon Glass <sjg@google.com>, Stephen Barber <smbarber@chromium.org>, Filipe Brandenburger <filbranden@google.com>, Todd Broch <tbroch@chromium.org>, linux-samsung-soc@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>

Hello Lee,

On 05/05/2015 12:54 PM, Lee Jones wrote:
> On Tue, 05 May 2015, Javier Martinez Canillas wrote:
>> On 04/29/2015 12:37 PM, Lee Jones wrote:
>> > On Thu, 23 Apr 2015, Gwendal Grignou wrote:
>> > 
>> >> Be consistent, use cros_ec instead of "cros ec" or "cros-ec".
>> > 
>> > What is this in reference to?
>> >
>> 
>> I think Gwendal meant that I should be consistent in general and was not
>> referring to this patch particular.
> 
> Better to quote one of the offending occurrences than to randomly
> top-post helpful comments.
> 

Just for clarification, on a second read I noticed that Gwendal was talking
about the subject line since $subject uses "mfd: cros ec" as a prefix while
most of the commits in the subsystem (and in the series) use "mfd: cros_ec".
Also, there is another patch (5/8) that used "mfd: cros-ec" so he is right
that I should had used cros_ec consistently.

Sorry for missing that and I will fix when posting v2.

Best regards,
Javier
