From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: Add the clock id for CMU_CDREX (DRAM
 Express Controller)
Date: Thu, 01 Sep 2016 19:28:37 +0200
Message-ID: <0dfc9f01-1cda-a1e2-c1f2-6e119a7c1a84@samsung.com>
References: <1472108238-24309-1-git-send-email-cw00.choi@samsung.com>
 <1472108238-24309-2-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1472108238-24309-2-git-send-email-cw00.choi@samsung.com>
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

On 08/25/2016 08:57 AM, Chanwoo Choi wrote:
> This patch adds the new clock id for CMU_CDRES (DRAM Express Controller)
> geneates the clocks for DRAM and NoC (Network on Chip) bus clock.
> 
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>

Applied with the commit message changed as below, thanks.

commit 9c605fbc299d31b482aefae547d126062c7a8792
Author: Chanwoo Choi <cw00.choi@samsung.com>
Date:   Thu Aug 25 15:57:16 2016 +0900

 dt-bindings: Add clock IDs for the CMU_CDREX (DRAM Express Controller)

 This patch adds missing clock IDs for CMU_CDREX (DRAM Express Controller)
 which generates clocks for DRAM and NoC (Network on Chip) busses.

 Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
 Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
