From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 6/7] spi/s3c64xx: Add support DMA engine API
Date: Tue, 5 Jul 2011 12:51:41 +0200
Message-ID: <201107051251.41653.heiko@sntech.de>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com>
	<20110704232758.GB12824@ponder.secretlab.ca>
	<00bd01cc3ae1$f1dbfac0$d593f040$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <00bd01cc3ae1$f1dbfac0$d593f040$%kim@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Boojin Kim' <boojin.kim@samsung.com>, 'Vinod Koul' <vinod.koul@intel.com>, 'Jassi Brar' <jassisinghbrar@gmail.com>, 'Grant Likely' <grant.likely@secretlab.ca>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Dan Williams' <dan.j.williams@intel.com>, 'Liam Girdwood' <lrg@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Am Dienstag, 5. Juli 2011, 09:05:32 schrieb Kukjin Kim:
[...]
> As a note, S3C24XX and S3C64XX include PL080 DMAC not PL330.
Are you sure the S3C24xx also uses a PL080?

At least for the 2416, the manual does not tell the type of DMA controller 
used. Also according to it it's a 6 channel controller where the pl080 has 8 
channels according to amba-pl08x.c .

So, to my untrained eye it looks like another type of controller - but I may 
be wrong.

Heiko
