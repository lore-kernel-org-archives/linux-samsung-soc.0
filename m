From: "pankaj.dubey" <pankaj.dubey@samsung.com>
Subject: Re: [3/4] PCI: exynos: Use the bitops API to operate the bit shifting
Date: Wed, 21 Dec 2016 11:52:27 +0530
Message-ID: <3cac1423-1e06-444d-01a4-2df2f335a0a6@samsung.com>
References: <20161219081740.5457-4-jh80.chung@samsung.com>
 <CGME20161221061953epcas1p433e2197077f1c9e1a46587d7aa602b2f@epcas1p4.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20161219081740.5457-4-jh80.chung@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jaehoon Chung <jh80.chung@samsung.com>, linux-pci@vger.kernel.org
Cc: helgaas@google.com, krzk@kernel.org, linux-kernel@vger.kernel.org, jingoohan1@gmail.com, javier@osg.samsung.com, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, cpgs@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Jaehoon,

On Monday 19 December 2016 01:47 PM, Jaehoon Chung wrote:
> Just use the bitops api to operate the bit.
> 
> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
> ---
>  drivers/pci/host/pci-exynos.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 

Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>
