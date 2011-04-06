From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH 5/7] v4l: s5p-fimc: add pm_runtime support
Date: Wed, 06 Apr 2011 09:25:45 +0200
Message-ID: <000001cbf42b$dbd9db90$938d92b0$%szyprowski@samsung.com>
References: <1302012410-17984-1-git-send-email-m.szyprowski@samsung.com>
	<1302012410-17984-6-git-send-email-m.szyprowski@samsung.com>
	<007c01cbf3f2$c6e7b420$54b71c60$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <007c01cbf3f2$c6e7b420$54b71c60$%han@samsung.com>
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
To: 'Jonghun Han' <jonghun.han@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Arnd Bergmann' <arnd@arndb.de>, 'Kyungmin Park' <kyungmin.park@samsung.com>, =?ks_c_5601-1987?B?J7DtwOe47Sc=?= <jemings@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, 'Marek Szyprowski' <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

On Wednesday, April 06, 2011 2:37 AM Jonghun Han wrote:

> runtime_pm is used to minimize current.
> In my opinion, the followings will be better.
> 1. Adds pm_runtime_get_sync before running of the first job.
>    IMO, dma_run callback function is the best place for calling in case of
> M2M.
> 2. And then in the ISR, call pm_runtime_put_sync in the ISR bottom-half if
> there is no remained job.

Right my pm_runtime implementation is very simple. I've just added it to test
if other subsystems are working.

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
