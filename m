From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: S3C64XX DSP support added
Date: Tue, 3 Nov 2009 09:47:51 +0000
Message-ID: <20091103094751.GA1520@rakim.wolfsonmicro.main>
References: <1257127774-5564-1-git-send-email-jassisinghbrar@gmail.com>
 <20091102104211.GA29351@sirena.org.uk>
 <1b68c6790911020310u18dbae52u89063b311e671d@mail.gmail.com>
 <20091102112358.GC29351@sirena.org.uk>
 <1b68c6790911020359u49e9f369hcefaab9b28aeaa27@mail.gmail.com>
 <20091102120732.GA7485@rakim.wolfsonmicro.main>
 <1b68c6790911021738p2b32b27rf688de5b7b2fa1e4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:56675 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755037AbZKCJrs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Nov 2009 04:47:48 -0500
Content-Disposition: inline
In-Reply-To: <1b68c6790911021738p2b32b27rf688de5b7b2fa1e4@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jassi brar <jassisinghbrar@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Tue, Nov 03, 2009 at 10:38:47AM +0900, jassi brar wrote:
> On Mon, Nov 2, 2009 at 9:07 PM, Mark Brown

> > Is there a PCM controller on the s3c24xx chips? =A0I know you're no=
t

> Only s3c2450 in the 24xx series have a pcm controller. Since there is
> no support for s3c2450 in mainline, I had to make it for s3c64xx

In that case the s3c- name would be nice in case someone does submit
support for that CPU some time.
