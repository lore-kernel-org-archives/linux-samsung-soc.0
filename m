From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 6/9] tests/exynos: remove struct fimg2d_test_case
Date: Fri, 12 Jun 2015 18:25:21 +0200
Message-ID: <557B07F1.6040400@math.uni-bielefeld.de>
References: <1433943748-15849-1-git-send-email-tjakobi@math.uni-bielefeld.de>	<1433943748-15849-7-git-send-email-tjakobi@math.uni-bielefeld.de> <CACvgo51saXm3of0S2n_AL61X7KaoarrA_=Cc75ri==P=KH8jGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:50739 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755720AbbFLQZX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Jun 2015 12:25:23 -0400
In-Reply-To: <CACvgo51saXm3of0S2n_AL61X7KaoarrA_=Cc75ri==P=KH8jGA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Joonyoung Shim <jy0922.shim@samsung.com>, gustavo.padovan@collabora.co.uk, Inki Dae <inki.dae@samsung.com>

Hello Emil,

Emil Velikov wrote:
> On 10 June 2015 at 14:42, Tobias Jakobi <tjakobi@math.uni-bielefeld.de> wrote:
>> It doesn't make sense to keep this structure, since we
>> can just call all tests directly.
>>
> Seems like it was designed in mind of having another test case.
> Perhaps the exynos guys cannot really upstream it (licensing or other
> issues) ?
might be. But why should we care about that anyway?

My personal guess: Big giant code bomb which noone bothered to check. ;)


With best wishes,
Tobias



> 
> -Emil
> 
