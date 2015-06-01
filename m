From: Ben Gamari <ben@smart-cactus.org>
Subject: Exynos 5410 support (was [PATCH 6/6] ARM: dts: exynos5420: add sysmmu
 nodes)
Date: Mon, 01 Jun 2015 15:12:24 -0400
Message-ID: <556CAE98.1080906@smart-cactus.org>
References: <1432041645-11172-1-git-send-email-m.szyprowski@samsung.com>
 <1433153450-3680-1-git-send-email-m.szyprowski@samsung.com>
 <1433153450-3680-7-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1433153450-3680-7-git-send-email-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@dowhile0.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 06/01/2015 06:10 AM, Marek Szyprowski wrote:
> This patch adds System MMU nodes to all defined devices that are specific
> to Exynos5420/5800/5422 series.

Apologies in advance if Thunderbird mangles this message; my usual mail 
configuration has suffered an unfortunate run-in with a mug of tea.

As someone who has devoted a few weekends trying to make the mainline 
kernel usable on an Odroid XU2, I can't help but notice that nearly 
every patchset that has hit this list recently excludes the Exynos 541x 
devices, including series which appear to go out of their way to support 
older devices. I would attribute this to the lack of publicly accessible 
documentation, but many of these patches are coming from Samsung 
employees.  Worse, the few patches that have been submitted for the 5410 
have languished in queue-purgatory. What is going on with support for 
this silicon?

These devices really aren't that old but if Samsung insists that they 
aren't worth putting engineering time towards then perhaps they could at 
least release documentation? The Hardkernel folks are on the record[2] 
as saying there was a document under review. Perhaps this document could 
be quickly trimmed into a disclosable state? Even a quick-and-dirty 
documentation release would help my efforts substantially.

Cheers,

- Ben


[1] https://github.com/bgamari/linux/commits/odroid-3.19
[2] http://forum.odroid.com/viewtopic.php?f=65&t=1932#p20457
