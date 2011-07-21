From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH V4 03-1/13] DMA: PL330: Support DMA_SLAVE_CONFIG command
Date: Thu, 21 Jul 2011 17:02:55 +0100
Message-ID: <20110721160255.GQ26574@n2100.arm.linux.org.uk>
References: <1311158773-30314-1-git-send-email-boojin.kim@samsung.com>
	<1311158773-30314-3-git-send-email-boojin.kim@samsung.com>
	<CABb+yY2_XKyCr2mEzqd0bCYJk3U7+sg8Xz4b4ma2KB1BconYOw@mail.gmail.com>
	<20110721081138.GL26574@n2100.arm.linux.org.uk>
	<CABb+yY2obv5JMBiRSXS-4tSCYX+7nVVaA0Q7gurA+NndrGVuvA@mail.gmail.com>
	<20110721112920.GM26574@n2100.arm.linux.org.uk>
	<CABb+yY2p8VNSvhv+LjoYnunrYS8+3+841bKM-4aUsg5vNx=Mig@mail.gmail.com>
	<20110721152342.GE28942@n2100.arm.linux.org.uk>
	<CABb+yY193Tg1XfnkK3GYYaYWmZYRgeqnGnS_dNC4H1TFTGO_pA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CABb+yY193Tg1XfnkK3GYYaYWmZYRgeqnGnS_dNC4H1TFTGO_pA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Boojin Kim <boojin.kim@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Jul 21, 2011 at 09:26:22PM +0530, Jassi Brar wrote:
> Though you might want to consider changing the DMA_SLAVE_CONFIG API from
> optional to mandatory for Slave capable DMACs. Otherwise I don't see common
> client drivers working over different DMACs.

Yes, I think we will have to, otherwise we can't ensure we have cross-
compatibility between different DMA engine implementations.

We already have platforms where we have peripheral drivers making use of
several different DMA engine implementations, so nailing this down now,
before the number of DMA engine implementations increases still further
is definitely something that needs doing.
