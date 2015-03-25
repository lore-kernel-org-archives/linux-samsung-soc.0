From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 1/5] tests/exynos: add fimg2d performance analysis
Date: Wed, 25 Mar 2015 19:27:16 +0100
Message-ID: <5512FE04.9000600@math.uni-bielefeld.de>
References: <1426890348-12807-1-git-send-email-tjakobi@math.uni-bielefeld.de> <1426890348-12807-2-git-send-email-tjakobi@math.uni-bielefeld.de> <550EE197.1090008@gmail.com> <550EEF54.4050109@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:49308 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752212AbbCYS1T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Mar 2015 14:27:19 -0400
In-Reply-To: <550EEF54.4050109@gmx.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <liquid.acid@gmx.net>, Emil Velikov <emil.l.velikov@gmail.com>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, m.szyprowski@samsung.com, inki.dae@samsung.com

Hello,

the new version should fix most of the mentioned issues.

Tobias Jakobi wrote:
>> As a general note I would recommend keeping statements on separate lines
>> (none of if (foo) far()) as it makes debugging easier.
> OK, changing this.
Except for this, I didn't change it since I don't see the point. In fact
I think that splitting the few occurrences makes the code less readable.

I haven't worked with getopt before, so I gave it a try and made all
these hardcoded parameters configurable.

With best wishes,
Tobias
