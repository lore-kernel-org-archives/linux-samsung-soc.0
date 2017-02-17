From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 03/15] media: s5p-mfc: Replace mem_dev_* entries with an
 array
Date: Fri, 17 Feb 2017 14:47:06 -0300
Message-ID: <d64d73fe-380f-15cd-63e6-e72648e9549a@osg.samsung.com>
References: <1487058728-16501-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170214075215eucas1p2c3c06daf02ca5b3d29bce024fc9898e1@eucas1p2.samsung.com>
 <1487058728-16501-4-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1487058728-16501-4-git-send-email-m.szyprowski@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Marek,

On 02/14/2017 04:51 AM, Marek Szyprowski wrote:
> Internal MFC driver device structure contains two pointers to devices used
> for DMA memory allocation: mem_dev_l and mem_dev_r. Replace them with the
> mem_dev[] array and use defines for accessing particular banks. This will
> help to simplify code in the next patches.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
