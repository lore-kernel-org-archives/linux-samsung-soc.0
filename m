From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/4] Consolidate Exynos machine code
Date: Wed, 19 Mar 2014 14:29:11 +0100
Message-ID: <201403191429.11721.arnd@arndb.de>
References: <1395231957-22032-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1395231957-22032-1-git-send-email-sachin.kamat@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: kgene.kim@samsung.com, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wednesday 19 March 2014, Sachin Kamat wrote:
> This patch series consolidates the Exynos machine code and common
> code into a single file to avoid code duplication and introduces
> generic compatible strings for Exynos4 and 5 SoC series.
> 
> Complete discussion and motivation for this series is found here:
> http://comments.gmane.org/gmane.linux.kernel.samsung-soc/27268
> 
> This series is based on the latest linux-next and depends on
> 1. Tomasz Figa's PM consolidation series 1 and 2
> 2. Patch: ARM: SAMSUNG: Reorganize calls to reserve memory for MFC
> http://www.spinics.net/lists/linux-samsung-soc/msg25501.html
> 3. Patch: ARM: EXYNOS: Add support to reserve memory for MFC-v7
> http://www.spinics.net/lists/arm-kernel/msg315940.html
> 4. Kconfig and CPU init Consolidation series
> http://article.gmane.org/gmane.linux.kernel.samsung-soc/28216

Acked-by: Arnd Bergmann <arnd@arndb.de>
