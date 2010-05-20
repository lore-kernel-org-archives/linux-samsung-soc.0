From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH] ARM: Samsung: Add platform support code for OneNAND
	controller
Date: Thu, 20 May 2010 11:33:30 +0200
Message-ID: <014f01caf7ff$84d456f0$8e7d04d0$%szyprowski@samsung.com>
References: <1274338745-1745-1-git-send-email-m.szyprowski@samsung.com>
	<20100520084848.GO4720@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20100520084848.GO4720@trinity.fluff.org>
Content-language: pl
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Ben Dooks' <ben-linux@fluff.org>
Cc: kgene.kim@samsung.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

On Thursday, May 20, 2010 10:49 AM Ben Dooks wrote:

> On Thu, May 20, 2010 at 08:59:05AM +0200, Marek Szyprowski wrote:
> > This patch adds setup code for Samsung OneNAND controller driver. The
> > driver needs to be aware on which SoC it is running, so the actual
> > device id is being changed in cpu init code. S3C64xx SoCs have 2 OneNAND
> > controllers while S5PC100 and S5PC110 has only one.
> >
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> 
> Ok, in future please try and keep a core and then have the architecture
> additions seperate, it makes it very difficult to deal with any problems
> whilst merging and means there is a higher possibility of a problem during
> this.

Ok, but I'm still not 100% sure how should I handle case like this properly.
I thought that separating platform files from the driver itself would help
merging it, because each part (the driver and platform setup code/register
definitions) can be merged separately by the respective maintainers. Was it
wrong that the platform patch was prepared for the tree after plat-s5pc1xx
moves? 

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center
