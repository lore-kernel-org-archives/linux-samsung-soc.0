From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 3/4] PCI: exynos: Use the bitops API to operate the bit
 shifting
Date: Sat, 24 Dec 2016 12:54:03 +0200
Message-ID: <20161224105403.GB6103@kozik-lap>
References: <20161219081740.5457-1-jh80.chung@samsung.com>
 <20161219081740.5457-4-jh80.chung@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161219081740.5457-4-jh80.chung@samsung.com>
Sender: linux-pci-owner@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-pci@vger.kernel.org, helgaas@google.com, krzk@kernel.org, linux-kernel@vger.kernel.org, jingoohan1@gmail.com, javier@osg.samsung.com, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, cpgs@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Dec 19, 2016 at 05:17:39PM +0900, Jaehoon Chung wrote:
> Just use the bitops api to operate the bit.
> 
> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
> ---
>  drivers/pci/host/pci-exynos.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
 

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
