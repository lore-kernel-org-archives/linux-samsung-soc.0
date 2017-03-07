From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] ARM: exynos_defconfig: increase
 CONFIG_CMA_SIZE_MBYTES to 96
Date: Tue, 7 Mar 2017 21:03:17 +0200
Message-ID: <20170307190317.5gbxy4nmj67tvimi@kozik-lap>
References: <20170228191221.18135-1-shuahkh@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170228191221.18135-1-shuahkh@osg.samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shuah Khan <shuahkh@osg.samsung.com>
Cc: inki.dae@samsung.com, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, cw00.choi@samsung.com, viresh.kumar@linaro.org, rafael.j.wysocki@intel.com, robie@justgohome.co.uk, linux@armlinux.org.uk, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, a.hajda@samsung.com, javier@osg.samsung.com, b.zolnierkie@samsung.com, kgene@kernel.org, s.nawrocki@samsung.com, shuah@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Feb 28, 2017 at 12:12:21PM -0700, Shuah Khan wrote:
> Current CMA size of 64 Mbytes is right on the edge of being small when
> several drivers need to allocate large CMA buffers.
> 
> For example, if the s5p-mfc driver needs to pre-allocate N MiB CMA memory
> to decode a H.264 1080p video, then there won't be enough CMA memory left
> for other drivers, such as the exynos-drm driver that may need to allocate
> GEM buffers for the display manager.
> 
> Increasing CMA size to 96 Mbytes in exynos_defconfig addresses use-cases
> such as these.
> 
> Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Shuah Khan <shuahkh@osg.samsung.com>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
> 
> Changes since v1:
> Fix short and long commit log.
> 
> Reason for this patch:
> With the proposed s5p_mfc patch series that pre-allocate buffers, when
> display manager starts, it fails to get GEM buffers.  Increasing the CMA
> size to 96 solved the problem.
> 
>  arch/arm/configs/exynos_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Thanks, applied with slightly changed commit msg.

Best regards,
Krzysztof
