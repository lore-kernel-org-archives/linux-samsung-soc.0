From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH V7 11/12] Documentation: bridge: Add documentation for
 ps8622 DT properties
Date: Tue, 23 Sep 2014 12:34:54 +0200
Message-ID: <54214CCE.7050102@samsung.com>
References: <1409150399-12534-1-git-send-email-ajaykumar.rs@samsung.com>
 <5419760A.7020908@ti.com>
 <CAEC9eQPn63upE6XEZZtJWGdOAhWWNvU9EhfOXJ=x0i467q+iMQ@mail.gmail.com>
 <5419B52D.4060107@ti.com> <20140922080629.GC1470@ulmo>
 <542030DD.3060906@ti.com> <20140923060452.GD30514@ulmo>
 <5421201C.6000509@samsung.com> <20140923083514.GM30514@ulmo>
 <542140D3.8080806@samsung.com> <20140923101032.GU30514@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <20140923101032.GU30514@ulmo>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, sunil joshi <joshi@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Ajay kumar <ajaynumb@gmail.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 09/23/2014 12:10 PM, Thierry Reding wrote:
> On Tue, Sep 23, 2014 at 11:43:47AM +0200, Andrzej Hajda wrote:
>> On 09/23/2014 10:35 AM, Thierry Reding wrote:
> [...]
>>> But I agree that it would be nice to unify bridges and encoders more. It
>>> should be possible to make encoder always a bridge (or perhaps even
>>> replace encoders with bridges altogether). Then once you're out of the
>>> DRM device everything would be a bridge until you get to a panel.
>> I agree that some sort of unification of bridges, (slave) encoders is a good
>> thing, this way we stay only with bridges and panels as receivers.
>> But we will still have to deal with the code like:
>>     if (on the other end of the link is panel)
>>         do panel framework specific things
>>     else
>>         do bridge framework specific things
>>
>> The code in both branches usually does similar things but due to framework
>> differences it is difficult to merge.
> That's because they are inherently different entities. You can perform
> operations on a panel that don't make sense for a bridge and vice-versa.
>
>> Ideally it would be best to get rid of such constructs. For example by
>> trying to
>> make frameworks per interface type exposed by device (eg. video_sink) and
>> not by device type (drm_bridge, drm_panel).
> But then you loose all information about the real type of device.
Driver knows type of its device anyway. Why should it know device
type of devices it is connected to? It is enough it knows how to talk to
other device.
Like in real world, why desktop PC should know it is connected to DVI
monitor or to
DVI/HDMI converter which is connected to TV?
>  Or you
> have to create a common base class. And then you're still back to
> dealing with the two specific cases in many places, so the gain seems
> rather minimal.

For example RGB panel and RGB/??? bridge have the same hardware input
interface.
Why shall they have different representation in kernel?

Regards
Andrzej

>
> Thierry
