From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 0/9] Add clkdev support for Samsung platforms
Date: Wed, 15 Jun 2011 10:35:21 +0200
Message-ID: <20110615083521.GF3037@game.jcrosoft.org>
References: <1307594324-11053-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1307594324-11053-1-git-send-email-thomas.ab@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 10:08 Thu 09 Jun     , Thomas Abraham wrote:
> This patch series adds clkdev support for all Samsung platforms. clkdev
> support is a prerequisite for adding device tree on Samsung platforms
> and possibly revive framebuffer driver patches for Exynos4 platforms.
> 
> The first of the two patches are for eliminating the explict
> console_initcall from the serial drivers. This is required to prevent
> the clk_get being invoked at time when device registrations have not
> completed.
> 
> This patch series is based on the latest
> git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git for-next
> 
> and the patch "[PATCH] Consolidate the clkdev header files".
> 
> It has been tested on the following boards.
> 
> SMDK2416, SMDK2440, SMDK2450, SMDK6410, SMDK6440, SMDK6450,
> SMDKC100, SMDKV210 and SMDKV310.
looks good
Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>

Best Regards,
J.
