From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [RFC PATCH 07/15] ARM: exynos: fixup debug macros for big-endian
Date: Fri, 10 Jun 2016 12:12:22 +0100
Message-ID: <ab51fcde-dfee-a70c-53c4-09485bfa7669@codethink.co.uk>
References: <20160608183110.13851-1-matthew@mattleach.net>
 <20160608183110.13851-8-matthew@mattleach.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160608183110.13851-8-matthew@mattleach.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Leach <matthew@mattleach.net>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 08/06/16 19:31, Matthew Leach wrote:
> From: Ben Dooks <ben.dooks@codethink.co.uk>
> 
> The exynos low-level debug macros need to be fixed if the system is being
> built big endian. Add the necessary endian swaps for accessing the registers
> to get output working again
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  arch/arm/include/debug/samsung.S | 8 ++++++++
>  1 file changed, 8 insertions(+)

Should this go via the maintainer or to RMK?

If to RMK, then shall I get it submitted (and does anyone else
want to ack?)

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
