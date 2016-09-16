From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] media: s5p-mfc: fix failure path of
 s5p_mfc_alloc_memdev()
Date: Fri, 16 Sep 2016 12:35:07 -0400
Message-ID: <101e33da-dc1b-74de-15e9-62ed014e3f60@osg.samsung.com>
References: <CGME20160916061511eucas1p21e71e28d5f12ef94694ccbdec8379774@eucas1p2.samsung.com>
 <1474006490-13283-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1474006490-13283-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Marek,

On 09/16/2016 02:14 AM, Marek Szyprowski wrote:
> s5p_mfc_alloc_memdev() function lacks proper releasing of allocated device
> in case of reserved memory initialization failure. This results in NULL pointer
> dereference:

Patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
