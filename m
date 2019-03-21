From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 3/4] media: s5p-cec: fix possible object reference
 leak
Date: Thu, 21 Mar 2019 12:51:48 +0100
Message-ID: <376c5ed6-7c2d-62a1-9ed0-48a329965d06@samsung.com>
References: <CGME20190212234951epcas3p3c5dff046aab328e983ecdcecb916148c@epcas3p3.samsung.com>
        <1550015279-42723-1-git-send-email-wen.yang99@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550015279-42723-1-git-send-email-wen.yang99@zte.com.cn>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Wen Yang <wen.yang99@zte.com.cn>
Cc: mchehab@kernel.org, linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, xue.zhihong@zte.com.cn, wang.yi59@zte.com.cn, "Hans Verkuil (hansverk)" <hansverk@cisco.com>, Hans Verkuil <hans.verkuil@cisco.com>, Wen Yang <yellowriver2010@hotmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi

On 2019-02-13 00:47, Wen Yang wrote:
> The call to of_parse_phandle() returns a node pointer with refcount
> incremented thus it must be explicitly decremented here after the last
> usage.
> The of_find_device_by_node() takes a reference to the underlying device
> structure, we also should release that reference.
> This patch fixes those two issues.
>
> Hans Verkuil says:
> The cec driver should never take a reference of the hdmi device.
> It never accesses the HDMI device, it only needs the HDMI device pointer as
> a key in the notifier list.
> The real problem is that several CEC drivers take a reference of the HDMI
> device and never release it. So those drivers need to be fixed.
>
> Fixes: a93d429b51fb ("[media] s5p-cec: add cec-notifier support, move out of staging")
> Suggested-by: Hans Verkuil (hansverk) <hansverk@cisco.com>
> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> Cc: Hans Verkuil (hansverk) <hansverk@cisco.com>
> Cc: Hans Verkuil <hans.verkuil@cisco.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Wen Yang <yellowriver2010@hotmail.com>
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-media@vger.kernel.org

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
> v2->v1:
> - move of_node_put() to just after the 'hdmi_dev = of_find_device_by_node(np)'.
> - put_device() can be done before the cec = devm_kzalloc line.
>
>   drivers/media/platform/s5p-cec/s5p_cec.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/platform/s5p-cec/s5p_cec.c b/drivers/media/platform/s5p-cec/s5p_cec.c
> index 8837e26..1f5c355 100644
> --- a/drivers/media/platform/s5p-cec/s5p_cec.c
> +++ b/drivers/media/platform/s5p-cec/s5p_cec.c
> @@ -192,9 +192,11 @@ static int s5p_cec_probe(struct platform_device *pdev)
>   		return -ENODEV;
>   	}
>   	hdmi_dev = of_find_device_by_node(np);
> +	of_node_put(np);
>   	if (hdmi_dev == NULL)
>   		return -EPROBE_DEFER;
>   
> +	put_device(&hdmi_dev->dev);
>   	cec = devm_kzalloc(&pdev->dev, sizeof(*cec), GFP_KERNEL);
>   	if (!cec)
>   		return -ENOMEM;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
