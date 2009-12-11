From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [samsung-soc] CPUfreq Linux clock API question
Date: Fri, 11 Dec 2009 14:01:57 +0000
Message-ID: <20091211140156.GC25806@sirena.org.uk>
References: <000b01ca7a68$6d5f4cb0$481de610$%majewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:60882 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754217AbZLKOBz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Dec 2009 09:01:55 -0500
Content-Disposition: inline
In-Reply-To: <000b01ca7a68$6d5f4cb0$481de610$%majewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lukasz Majewski <l.majewski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, 'Kyungmin Park' <kyungmin.park@samsung.com>, Tomasz Fujak <t.fujak@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org

On Fri, Dec 11, 2009 at 02:47:06PM +0100, Lukasz Majewski wrote:

> The clock API used at S3C64xx seems not to allow for setting rate of two
> clocks simultaneously (or am I wrong? :-) ). 

Yes, the Linux clock API doesn't support that.

> If this change would not be possible, then have anyone thought about the way
> to provide such functionality? 

Is it really needed?  The clock updates usually need to be serialised
anyway by virtue of having to update multiple registers.  If it is
required I could see doing something like have "start updates" and
"commit updates" calls which would allow updates to be batched.
