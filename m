From: Boojin Kim <boojin.kim@samsung.com>
Subject: RE: [PATCH V4 12/14] spi/s3c64xx: Add support DMA engine API
Date: Mon, 25 Jul 2011 19:34:32 +0900
Message-ID: <002101cc4ab6$70fa0ac0$52ee2040$%kim@samsung.com>
References: <1311557312-26107-1-git-send-email-boojin.kim@samsung.com>
	<1311557312-26107-13-git-send-email-boojin.kim@samsung.com>
	<20110725094002.GD9653@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20110725094002.GD9653@n2100.arm.linux.org.uk>
Content-language: ko
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Vinod Koul' <vinod.koul@intel.com>, 'Jassi Brar' <jassisinghbrar@gmail.com>, 'Grant Likely' <grant.likely@secretlab.ca>, linux-samsung-soc@vger.kernel.org, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Dan Williams' <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Russell King - ARM Linux Wrote:

> Sent: Monday, July 25, 2011 6:40 PM
> To: Boojin Kim
> Cc: linux-arm-kernel@lists.infradead.org;
linux-samsung-soc@vger.kernel.org;
> Kukjin Kim; Vinod Koul; Jassi Brar; Grant Likely; Mark Brown; Dan Williams
> Subject: Re: [PATCH V4 12/14] spi/s3c64xx: Add support DMA engine API
>
> On Mon, Jul 25, 2011 at 10:28:30AM +0900, Boojin Kim wrote:
> > +static void s3c64xx_spi_dma_rxcb(void *data)
> > +{
> > +	struct s3c64xx_spi_driver_data *sdd
> > +		= (struct s3c64xx_spi_driver_data *)data;
>
> You never need explicit casts from void * or to void *.  Please remove
> these.
I will address your comment.
