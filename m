From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/7] S3C AUDIO: Rename s3c24xx-pcm driver to generic
	s3c_audio
Date: Wed, 4 Nov 2009 11:06:25 +0000
Message-ID: <20091104110625.GC25044@sirena.org.uk>
References: <1257323349-18481-1-git-send-email-jassisinghbrar@gmail.com> <1257323349-18481-2-git-send-email-jassisinghbrar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:50640 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754747AbZKDLGU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Nov 2009 06:06:20 -0500
Content-Disposition: inline
In-Reply-To: <1257323349-18481-2-git-send-email-jassisinghbrar@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jassisinghbrar@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Wed, Nov 04, 2009 at 05:29:04PM +0900, jassisinghbrar@gmail.com wrote:
> From: Jassi Brar <jassi.brar@samsung.com>
> 
> Following the s3c24xx_pcm prefix rename, the driver is also renamed.

This needs to be part of the previous patch, without these changes the
previous patch will cause the code to fail to build.
