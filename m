From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: Re: [PATCHv3 1/5] drm: exynos: hdmi: remove usage of struct
 s5p_hdmi_platform_data
Date: Thu, 17 Apr 2014 09:26:02 +0200
Message-ID: <534F820A.4090608@samsung.com>
References: <1397661178-6016-1-git-send-email-t.stanislaws@samsung.com>
 <1397661178-6016-2-git-send-email-t.stanislaws@samsung.com>
 <534F3467.1070707@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <534F3467.1070707@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: pawel.moll@arm.com, b.zolnierkie@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, rahul.sharma@samsung.com, m.chehab@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Joonyoung,

On 04/17/2014 03:54 AM, Joonyoung Shim wrote:
> Hi Tomasz,
> 
> On 04/17/2014 12:12 AM, Tomasz Stanislawski wrote:
>> This patch continues shift of DRM EXYNOS to DT-only configuration.
>> The usage of the old structure for HDMI's platform data is
>> removed.
>>
>> Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>

[snip]

>>   +    ret = drm_hdmi_dt_parse(hdata, dev->of_node);
>> +    if (ret)
>> +        return -EINVAL;
> 
> It's better to return ret value.
> 

I was considering return ret value. However, I preferred to
be consistent with other 'returns' which returns error literals.

Anyway, I will change it to 'return ret'.

Regards,
Tomasz Stanislawski
