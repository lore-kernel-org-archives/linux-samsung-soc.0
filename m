From: Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH V6 6/8] drm/bridge: Modify drm_bridge core to support
 driver model
Date: Wed, 17 Sep 2014 19:22:00 +1000
Message-ID: <CAPM=9txquE_n6mGHLpD1fzRD69Ldws0Mc1SHgaVrtQy0T-Q3wg@mail.gmail.com>
References: <1406316130-4744-1-git-send-email-ajaykumar.rs@samsung.com>
 <1406316130-4744-7-git-send-email-ajaykumar.rs@samsung.com>
 <2567411.1uGei9I2NP@avalon>
 <CAEC9eQMYTELvK_0bcrs+wNk=qYXzS69bOqYGr-yLf6h18bfM4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAEC9eQMYTELvK_0bcrs+wNk=qYXzS69bOqYGr-yLf6h18bfM4Q@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ajay kumar <ajaynumb@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

>>
>> Before the introduction of the component framework I would have said this is
>> the way to go. Now, I think bridges should register themselves as components,
>> and the DRM master driver should use the component framework to get a
>> reference to the bridges it needs.
> Well, I have modified the bridge framework exactly the way Thierry wanted it
> to be, I mean the same way the current panel framework is.
> And, I don't think there is a problem with that.
> What problem are you facing with current bridge implementation?
> What is the advantage of using the component framework to register bridges?

At this point I'd rather merge something that keep iterating out of
tree, if this enables current hw to work and is better than what we
have we should merge it, and if we can get interest in using the
component framework then we should look at that as a separate problem.

Dave.
