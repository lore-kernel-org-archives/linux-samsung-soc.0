From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/2] clk: samsung: exynos5260: Move struct samsung_cmu_info
 to init section
Date: Thu, 01 Sep 2016 19:06:52 +0200
Message-ID: <b541e8a7-5ed0-6e02-dc05-26a5ab8a64e4@samsung.com>
References: <1471834185-20249-1-git-send-email-cw00.choi@samsung.com>
 <1471834185-20249-2-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1471834185-20249-2-git-send-email-cw00.choi@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: k.kozlowski@samsung.com, linux-samsung-soc@vger.kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org, tomasz.figa@gmail.com, linux-kernel@vger.kernel.org, kgene@kernel.org, chanwoo@kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 08/22/2016 04:49 AM, Chanwoo Choi wrote:
> This patch moves the all samsung_cmu_info struct to initconst section
> because they are used only in initconst section.
> 
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>

Applied with the commit message changed as below, thanks.

--------8<--------
clk: samsung: exynos5260: Move struct samsung_cmu_info to init section
    
 This patch moves the samsung_cmu_info struct instances to initconst section,
 this decreases the kernel image size by 784 bytes, which makes zImage smaller
 by 480 bytes.
    
 The patch increases .init.rodata section size by 780 bytes but decreases
 .init.text section size by 1564 bytes.
    
 Size of the drivers/clk/samsung/clk-exynos5260.o object file is 29100 bytes
 without the patch and 28316 after applying the patch.
    
 The section size differences are as below:
 15c15
 <   3 .init.text    000006b8  00000000  00000000  00000034  2**2
 ---
 >   3 .init.text    0000009c  00000000  00000000  00000034  2**2
 25c25
 <   8 .init.rodata  00003f6c  00000000  00000000  00002f20  2**2
 ---
 >   8 .init.rodata  00004278  00000000  00000000  00002904  2**2
    
 Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
 Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
--------8<--------
