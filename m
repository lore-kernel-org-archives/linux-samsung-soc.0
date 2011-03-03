From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S5P: Add platform helpers for camera GPIO
	configuration
Date: Thu, 03 Mar 2011 16:36:08 +0900
Message-ID: <01c601cbd975$c77cb170$56761450$%kim@samsung.com>
References: <1297447665-19492-1-git-send-email-s.nawrocki@samsung.com>
	<1297447665-19492-2-git-send-email-s.nawrocki@samsung.com>
	<4D67AB20.8000000@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <4D67AB20.8000000@samsung.com>
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
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Sylwester Nawrocki wrote:
> 
> 
> On 02/11/2011 07:07 PM, Sylwester Nawrocki wrote:
> > Add functions for the parallel camera GPIO interface
> > configuration on S5PV210 and S5PV310 SoCs.
> >
> 
> Kukjin, are you OK with general concept of those?
> I would probably need to rework the patches after recent
> S5PV310 -> EXYNOS4 renaming. And move camera.h
> to arch/arm/plat-samsung/include/plat/?
> 
> What's your opinion?

Oh, missed...yeah need to re-work based on exynos4 :)
And you don't need to move it into plat-samsung/ because plat-s5p/ is used
for Exynos also.

Please refer to my comments on it.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
