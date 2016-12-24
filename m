From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 4/4] PCI: exynos: remove the duplicated codes
Date: Sat, 24 Dec 2016 13:02:34 +0200
Message-ID: <20161224110234.GA7833@kozik-lap>
References: <20161219081740.5457-1-jh80.chung@samsung.com>
 <20161219081740.5457-5-jh80.chung@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161219081740.5457-5-jh80.chung@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-pci@vger.kernel.org, helgaas@google.com, krzk@kernel.org, linux-kernel@vger.kernel.org, jingoohan1@gmail.com, javier@osg.samsung.com, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, cpgs@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Dec 19, 2016 at 05:17:40PM +0900, Jaehoon Chung wrote:
> Removed the duplicated codes.
> It can use the more simply than now.
> 
> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
> ---
>  drivers/pci/host/pci-exynos.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
