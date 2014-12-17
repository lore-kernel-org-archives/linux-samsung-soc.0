From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [PATCH V8 00/14] drm/exynos: few patches to enhance bridge chip
 support
Date: Wed, 17 Dec 2014 10:31:41 +0100
Message-ID: <54914D7D.9060108@collabora.co.uk>
References: <1416045309-13359-1-git-send-email-ajaykumar.rs@samsung.com>
 <CAEC9eQOrKw2Z1q-ztFfadXmsL3CTcAkkv9kcS2QnDOAVSh2AuQ@mail.gmail.com>
 <548ABAB6.6010200@collabora.co.uk> <3197445.qizQc0zeRb@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <3197445.qizQc0zeRb@avalon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Ajay kumar <ajaynumb@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Pannaga Bhushan Reddy Patel <bhushan.r@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Laurent and Tomi,

On 12/16/2014 12:37 AM, Laurent Pinchart wrote:
> Hi Javier,
>> Tomi and Laurent,
>> 
>> You asked Ajay to change his series to use the video port and enpoints DT
>> bindings instead of phandles, could you please review his latest version?
>> 
>> I guess is now too late for 3.19 since we are in the middle of the merge
>> window but it would be great if this series can at least made it to 3.20.
> 
> I don't have time to review the series in details right now, but I'm happy 
> with the DT bindings, and have no big issue with the rest of the patches. I 
> don't really like the of_drm_find_bridge() concept introduced in 03/14 but I 
> won't nack it given lack of time to implement an alternative proposal. It's an 
> internal API, it can always be reworked later anyway.
> 

Thanks a lot for taking the time to look at the DT bindings, then I guess
that the series are finally ready to be merged?

Ajay's series don't apply cleanly anymore because it has been a while since
he posted it but he can rebase on top of 3.19-rc1 once it is released and
re-resend.

Best regards,
Javier
