From: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v2 5/5] iommu/exynos: Use bus_set_iommu instead of
	register_iommu
Date: Fri, 7 Oct 2011 13:37:01 +0200
Message-ID: <20111007113701.GC1512@8bytes.org>
References: <017001cc7f43$04a2db60$0de89220$%kim@samsung.com>
	<20110930134643.GS2138@amd.com>
	<CAHQjnOPiAOA_RiHnF-aVEYnWcdkwNzVD1BTNua+-ztZrW_+6_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CAHQjnOPiAOA_RiHnF-aVEYnWcdkwNzVD1BTNua+-ztZrW_+6_A@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: KyongHo Cho <pullip.cho@samsung.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "Roedel, Joerg" <Joerg.Roedel@amd.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "younglak1004.kim@samsung.com" <younglak1004.kim@samsung.com>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Sanghyun Lee <sanghyun75.lee@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Sat, Oct 01, 2011 at 08:52:45AM +0900, KyongHo Cho wrote:
> On Fri, Sep 30, 2011 at 10:46 PM, Roedel, Joerg <Joerg.Roedel@amd.com> wrote:
> > On Fri, Sep 30, 2011 at 03:31:49AM -0400, Kukjin Kim wrote:
> >> From: KyongHo Cho <pullip.cho@samsung.com>
> >>
> >> This replaces register_iommu() with bus_set_iommu() according to the
> >> suggestion of Joerg Roedel.
> >
> > This should be part of patch 3 already when the bus_set_iommu() change
> > is merged. Otherwise it breaks bisectability too.
> >
> Ok.
> Should I include fault handling feature (patch 4) in the patch 3 also?

Yes, makes sense to include patch 4 too.
