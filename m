From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: Re: [PATCH] drm/exynos: fix nested calls to lock mutex in drm resume
Date: Fri, 23 May 2014 07:44:08 +0530
Message-ID: <CAPdUM4Opv401gqwU5xvXa8Lmv0qc+0qxJWNzB+HJhtiH1ccF7A@mail.gmail.com>
References: <1398865294-6754-1-git-send-email-rahul.sharma@samsung.com>
 <CAPdUM4M3MdM2Dm2GPYXD-A18YDVGmKKBz+-uGDOmiTO=WUKu8A@mail.gmail.com>
 <CAK9yfHxK5tdaoBZTfs3MYheK2VjA-ddgWi=u7F3bHowUWU9bHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAK9yfHxK5tdaoBZTfs3MYheK2VjA-ddgWi=u7F3bHowUWU9bHQ@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 22 May 2014 23:26, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Hi Rahul,
>
>  On 22 May 2014 19:46, Rahul Sharma <rahul.sharma@samsung.com> wrote:
>> Hi Inki,
>>
>> This is another one which has not got reviewed. Please review.
>
> Inki has applied a similar patch from Takashi [1].

Thanks Sachin,

Good that solution is merged.

@ Inki, sorry for raising concern. It went unnoticed.

Regards,
Rahul Sharma.

>
> [1] https://lkml.org/lkml/2014/5/9/24
>
> --
> With warm regards,
> Sachin
