From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v3 0/6] ARM: EXYNOS: Add secure firmware support
Date: Thu, 22 Nov 2012 10:33:35 +0100
Message-ID: <4854667.0jktSvOtLR@amdc1227>
References: <1351178560-19188-1-git-send-email-t.figa@samsung.com>
 <3879194.hz9mrTmL6z@amdc1227>
 <0f5d01cdc87d$e7c81890$b75849b0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <0f5d01cdc87d$e7c81890$b75849b0$%kim@samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, arnd@arndb.de, tomasz.figa@gmail.com, kyungmin.park@samsung.com, olof@lixom.net, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Kgene,

On Thursday 22 of November 2012 15:52:14 Kukjin Kim wrote:
> Tomasz Figa wrote:
> > On Monday 12 of November 2012 09:55:30 Russell King - ARM Linux wrote:
> > > On Mon, Nov 12, 2012 at 04:39:28PM +0900, Kukjin Kim wrote:
> > > > (+ Russell King)
> > > 
> > > I think there's still an amount of work to do here; it's not a
> > > generic
> > > interface at the moment because it makes some assumptions about how
> > > things are done (eg, it assumes that there _will_ be a CPU boot
> > > register; that is not always true.
> > > 
> > > Moreover, the 'cpu' arguments given seem to be uncertain whether
> > > they're logical CPU numbers or physical CPU numbers.
> > > 
> > > Lastly, where is this interface actually documented?  It's just a
> > > bunch
> > > of code _without_ _any_ documentation.  That means people will
> > > interpret it differently, and it'll get used differently from
> > > platform to platform.
> > > 
> > > Let's have some documentation on this.
> > 
> > Right, I will include documentation in next version of this patchset.
> 
> Any updates on this?
> 
> Thanks.
> 
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.

I was waiting for some comments about my proposals, but since there is no 
new input I will prepare and post next version today.

Best regards.
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform
