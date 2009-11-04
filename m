From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: Revised patches for PCM Controller driver
Date: Wed, 4 Nov 2009 11:05:12 +0000
Message-ID: <20091104110512.GB25044@sirena.org.uk>
References: <1257323264-18363-1-git-send-email-jassisinghbrar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:50623 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754774AbZKDLFI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Nov 2009 06:05:08 -0500
Content-Disposition: inline
In-Reply-To: <1257323264-18363-1-git-send-email-jassisinghbrar@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jassisinghbrar@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Wed, Nov 04, 2009 at 05:27:44PM +0900, jassisinghbrar@gmail.com wrote:

> Acting upon the inputs given by Mark and Ben, I have revised the code.
> A few points to be noted:-

Please just post this stuff upstream, I'll review it fully there.

Unless the code is so awful it can clearly never be accepted upstream
without major work (which is not the case here) not submitting upstream
at the earliest opportunity is likely to slow things down, either
through the wait caused by an extra round of upstream submission or
through missing key subsystem specific feedback (as happened with the
IDE code, where several rounds of updates were done on code that would
never be accepted upstream due to using the old IDE subsystem).

> 1) The prefix s3c24xx_pcm_ in the platform driver has been changed to
>    more neutral s3c_audio_

Please use DMA or something else which indicates which part of the audio
subsystem it's driving.
