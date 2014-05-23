From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH v4] drm/exynos: enable fimd clocks in probe before
 accessing fimd registers
Date: Fri, 23 May 2014 17:14:45 +0530
Message-ID: <CAPdUM4Oge+Us=mXoDqXyZoLZnF0y=73m8oS4WcFSRZdfxPJeYw@mail.gmail.com>
References: <1400811591-10132-1-git-send-email-rahul.sharma@samsung.com>
 <537EFC05.6090708@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <537EFC05.6090708@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Sachin Kamat <sachin.kamat@linaro.org>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Kukjin Kim <kgene.kim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Andrej,

On 23 May 2014 13:13, Andrzej Hajda <a.hajda@samsung.com> wrote:
> Hi Rahul,
>
>
[snip]
>> +     clk_disable_unprepare(ctx->lcd_clk);
>> +     clk_disable_unprepare(ctx->bus_clk);
>> +
>>       return 0;
>
> If you want to access fimd registers I guess pm_runtime_get_sync should
> be called as well, to wake up display pm domain.
>

You are right. I have added pm runtime get sync and put sync.

Regards,
Rahul Sharma.

>
> Regards
> Andrzej
>
>
>>
>>  }
>>
>
