From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [RFC PATCH 03/15] clk: samsung: exynos4: fixup reg access on be
Date: Fri, 10 Jun 2016 11:51:56 +0200
Message-ID: <575A8DBC.4070403@samsung.com>
References: <20160608183110.13851-1-matthew@mattleach.net>
 <20160608183110.13851-4-matthew@mattleach.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <20160608183110.13851-4-matthew@mattleach.net>
Sender: linux-clk-owner@vger.kernel.org
To: Matthew Leach <matthew@mattleach.net>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Ben Dooks <ben.dooks@codethink.co.uk>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 06/08/2016 08:30 PM, Matthew Leach wrote:
> Use the byte-order aware big endian accessors, allowing for kernels
> running under big-endian.
> 
> Signed-off-by: Matthew Leach <matthew@mattleach.net>

Patch applied, thanks.

